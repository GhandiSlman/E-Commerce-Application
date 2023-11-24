import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/core/helper/database/cart_database_helper.dart';
import 'package:eco/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/enum.dart';

class CartViewModel extends GetxController {
  bool isFavorite(String itemId) {
    return favorite.any((item) => item.id == itemId);
  }
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  List<CartModel> _list = [];

  List<CartModel> get list => _list;

  List<CartModel> _favorite = [];
  List<CartModel> get favorite => _favorite;
  var dbHelper = CardDateBaseHelper.db;
  double get totalPrice => _totalPrice;
  double _totalPrice = 0;
  CartViewModel() {
    getAllProduct();
    getAllFavorite();
  }

  getAllFavorite() async {
    isLoading.value = true;
    print(_favorite.length);

    _favorite = await dbHelper.getAllFavorite();

    isLoading.value = false;
    update();
  }

  getAllProduct() async {
    isLoading.value = true;
    print(_list.length);

    _list = await dbHelper.getAllProduct();

    isLoading.value = false;
    getTotalPrice();
    update();
  }

  addProduct(CartModel model) async {
    bool isProductAlreadyAdded = false;

    for (int i = 0; i < list.length; i++) {
      if (list[i].id == model.id) {
        Get.snackbar('Hi', 'This product already added',
            backgroundColor: Colors.red[300]);
        isProductAlreadyAdded = true;
        break; // Break the loop if product is found
      }
    }

    if (!isProductAlreadyAdded) {
      await dbHelper.insert(model);
    }

    update();
  }

  addFavorite(CartModel model) async {
    int index = favorite.indexWhere((item) => item.id == model.id);
    if (index != -1) {
      await deleteFavorite(index);
    } else {
      await dbHelper.insertFavorite(model);
      favorite.add(model);
      update();
    }
  }

  getTotalPrice() {
    for (int i = 0; i < _list.length; i++) {
      _totalPrice += (double.parse(_list[i].price!) * _list[i].quantity);
    }
    update();
  }

  increaseQuantity(int index) async {
    _list[index].quantity++;
    _totalPrice += (double.parse(_list[index].price!));
    await dbHelper.updateProduct(_list[index]);
    update();
  }

  deleteCard(int index) async {
    await dbHelper.deleteProduct(_list[index].id!);
    _list.removeAt(index);
    update();
  }

  deleteFavorite(int index) async {
    await dbHelper.deleteFavorite(_favorite[index].id!);
    _favorite.removeAt(index);
    update();
  }

  decreaseQuantity(int index) async {
    _list[index].quantity--;
    if (list[index].quantity == 0) {
      await dbHelper.deleteProduct(_list[index].id!);
      _list.removeAt(index);
    } else if (_list[index].price != null) {
      _totalPrice -= double.parse(_list[index].price!);
      await dbHelper.updateProduct(_list[index]);
    }

    update();
  }
}
