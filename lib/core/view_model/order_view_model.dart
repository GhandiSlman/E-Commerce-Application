import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/core/const/colors.dart';
import 'package:eco/core/services/home_services.dart';
import 'package:eco/core/services/order_services.dart';
import 'package:eco/core/view_model/cart_view_model.dart';
import 'package:eco/view/screens/control_screen.dart';
import 'package:eco/view/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/cart_model.dart';
import '../../model/order_model.dart';
import '../helper/database/cart_database_helper.dart';
import '../helper/enum.dart';
import '../services/firestore_user.dart';

class OrderViewModel extends GetxController {
  CartViewModel model = Get.put(CartViewModel());
  RxBool isLoading = false.obs;
  var dbHelper = CardDateBaseHelper.db;
  late final TextEditingController street1;
  late final TextEditingController street2;
  late final TextEditingController city;
  late final TextEditingController state;
  late final TextEditingController country;
  void resetOrderInfo() {
    street1.clear();
    street2.clear();
    city.clear();
    state.clear();
    country.clear();
    update(); 
  }

  final List<OrderModel> _orderModel = [];
  List<OrderModel> get orderModel => _orderModel;

  Future<void> addOrder(String street1, String street2, String city,
      String state, String country, Delivery selectedDelivery) {
    isLoading.value = true;
    List<Map<String, dynamic>> cartData = model.list
        .map((item) => {
              'id': item.id,
              'image': item.image,
              'name': item.name,
              'price': item.price,
              'quantity': item.quantity,
            })
        .toList();

    return OrderServices().orderReference.add({
      'street1': street1, // John Doe
      'street2': street2, // Stokes and Sons
      'city': city,
      'state': state,
      'country': country,
      'products': cartData,
      'deliveryType': delivery1.value.toString(),
      'id': FirebaseAuth.instance.currentUser!.uid,
    }).then((value) {
      featchOrders();
      isLoading.value = false;
      model.list.clear();
      dbHelper.clearCart();
      update();
      Get.snackbar(
        'Hi',
        'Order added successfully',
        backgroundColor: AppColors.primaryColor,
      );
      Get.offAll(ControlScreen());
    }).catchError((error) {
      isLoading.value = false;
      Get.snackbar('Something went wrong', 'Please try again.',
          backgroundColor: Colors.red[300]);
    });
  }

  featchOrders() async {
    _orderModel.clear();
    await OrderServices().fetchAllOrders().then((value) {
      for (int i = 0; i < value.length; i++) {
        _orderModel
            .add(OrderModel.fromJson(value[i].data() as Map<String, dynamic>));
      }
      update();
    });
  }

  Future<void> deleteAllOrders() async {
    isLoading.value = true;
    QuerySnapshot querySnapshot = await OrderServices().orderReference.get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
    isLoading.value = false;
    update();
    _orderModel.clear();
  }

  var delivery1 = Delivery.StandardDelivery.obs;

  void updateDelivery(Delivery newDelivery) {
    delivery1.value = newDelivery;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    street1 = TextEditingController();
    street2 = TextEditingController();
    city = TextEditingController();
    state = TextEditingController();
    country = TextEditingController();
    delivery1.value = Delivery.StandardDelivery;
    featchOrders();
    super.onInit();
  }
}
