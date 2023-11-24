import 'package:eco/core/helper/database/local_storage.dart';
import 'package:eco/view/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/cart_model.dart';
import '../../model/user_model.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  final LocalStorage localStorage = Get.put(LocalStorage());
  ProfileViewModel() {
    getCurrentUser();
  }
  UserModel get model => _userModel;

  UserModel _userModel = UserModel();

  void getCurrentUser() async {
    isLoading.value = true;
    await localStorage.getUser.then((value) {
      _userModel = value!;
      isLoading.value = false;
    });
    update();
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    localStorage.deleteUser();
    Get.offAll(LoginScreen());
  }

  @override
  void onInit() {
    super.onInit();
  }
}
