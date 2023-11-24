import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderServices{
   
 final CollectionReference orderReference =
      FirebaseFirestore.instance.collection('Orders');
   Future<List<QueryDocumentSnapshot>> fetchAllOrders() async {
      var value =await orderReference.where('id' , isEqualTo: FirebaseAuth.instance.currentUser!.uid,)
          .get();
      return value.docs;
  }

  
}