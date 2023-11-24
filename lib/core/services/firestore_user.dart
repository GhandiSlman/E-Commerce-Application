import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/model/user_model.dart';

class FireStoreUser {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await userCollection.doc(userModel.id).set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String userId) async {
    return await userCollection.doc(userId).get();
  }
}
