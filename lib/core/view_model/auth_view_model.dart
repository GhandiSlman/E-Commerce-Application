//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/core/helper/database/local_storage.dart';
import 'package:eco/core/services/firestore_user.dart';
import 'package:eco/model/user_model.dart';
import 'package:eco/view/screens/control_screen.dart';
import 'package:eco/view/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view/screens/auth/login_screen.dart';

class AuthViewModel extends GetxController {
  bool isLoading = false;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  LocalStorage l = Get.find();
  late final TextEditingController email;
  late final TextEditingController password;
  late final TextEditingController name;
  Future<void> signInWithGoogle() async {
    isLoading = true;
    update();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await firebaseAuth.signInWithCredential(credential).then((user) async {
      saveUser(user);
      isLoading = false;
      update();
      Get.offAll(ControlScreen());
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      isLoading = true;
      update();
      final credential = await firebaseAuth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) =>
              FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
                setUser(
                    UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
              }));
      isLoading = false;
      update();
      Get.offAll(ControlScreen());
    } catch (e) {
      isLoading = false;
      update();
      Get.snackbar('Error login account', 'Your information is wrong',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      isLoading = true;
      update();
      final credential = await firebaseAuth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((user) async {
        saveUser(user);
      });
      isLoading = false;
      update();
      Get.offAll(ControlScreen());
    } catch (e) {
      isLoading = false;
      update();
      Get.snackbar('Error login account', 'Your information is wrong',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel model = UserModel(
      id: user.user!.uid,
      email: user.user!.email,
      name: name == null ? user.user!.displayName : name.text,
      image: '',
    );
    await FireStoreUser().addUserToFireStore(model);
    setUser(model);
  }

  setUser(UserModel model) async {
    await l.setUser(model);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    super.onInit();
  }
}
