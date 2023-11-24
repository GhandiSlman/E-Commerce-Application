import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/category_model.dart';
import '../../model/product_model.dart';
import '../services/home_services.dart';

class CategoryProductsViewModel extends GetxController {
  final id = Get.arguments['id'];
  bool isLoading = false;
  final List<ProductModel> _categoryProduct = [];
  List<ProductModel> get categoryProduct => _categoryProduct;

 getCProducts(String id) async {
  isLoading = true;
  update(); 

  await HomeServices().getCProducts(id).then((value) {
    for (int i = 0; i < value.length; i++) {
      _categoryProduct.add(
          ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
    }
    isLoading = false; 
    update(); 
  }).catchError((error) {

    isLoading = false; 
  });
}


  @override
  void onInit() {
    // TODO: implement onInit
    getCProducts(id);
    super.onInit();
  }
}
