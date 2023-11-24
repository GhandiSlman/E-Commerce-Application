import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/core/services/home_services.dart';
import 'package:eco/model/category_model.dart';
import 'package:eco/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {  //for storing searched users
List<ProductModel> searchList = <ProductModel>[];

  // for storing search status
  bool isSearching = false;

  void searchProducts(String query) {
    searchList.clear();
    isSearching = query.isNotEmpty;

    if (isSearching) {
      for (var product in productModel) {
        if (product.name!.toLowerCase().contains(query.toLowerCase()) ) {
          searchList.add(product);
        }
      }
    }
    update();
  }

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  

  final List<ProductModel> _categoryProduct = [];
  List<ProductModel> get categoryProduct => _categoryProduct;

  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  final List<ProductModel> _productsModel = [];
  List<ProductModel> get productModel => _productsModel;

  getCategory() async {
    isLoading.value = true;
    await HomeServices().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        isLoading.value = false;
      }
      update();
    });
  }

  getProducts() async {
    await HomeServices().getProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productsModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
      }
      update();
    });
  }

  @override
  void onInit() {
    getProducts();
    getCategory();
    super.onInit();
  }
}
