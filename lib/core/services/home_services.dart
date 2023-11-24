import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/model/category_model.dart';
import 'package:eco/model/product_model.dart';

class HomeServices {
  final CollectionReference categoryReference =
      FirebaseFirestore.instance.collection('Category');

  Future<List<QueryDocumentSnapshot>> fetchAllProducts(String id) async {
      var value =await categoryReference
          .doc(id)
          .collection('cProducts')
          .get();
      return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getCProducts(String id) async {
    var value = await categoryReference.doc(id).collection('cProducts').get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await categoryReference.get();
    return value.docs;
  }

  // final CollectionReference cProductRefrence =
  //     FirebaseFirestore.instance.collection('Category').doc();

  final CollectionReference productReference =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getProducts() async {
    var value = await productReference.get();
    return value.docs;
  }
}
