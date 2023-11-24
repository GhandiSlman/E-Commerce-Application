import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/view/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eco/core/view_model/order_view_model.dart';
import 'package:eco/model/order_model.dart';
import 'package:eco/view/widgets/custom_text.dart';
import '../../core/const/colors.dart';

class OrderHistoryScreen extends StatelessWidget {
  OrderModel? modell;

  OrderHistoryScreen({this.modell, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<OrderViewModel>(
        builder: (controller) {
          if (controller.orderModel.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/category.png'),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'No orders',
                  fontSize: 20,
                ),
              ],
            );
          }
          return Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ))
                : Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 10, right: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                                text: 'Order history', fontSize: 20),
                            IconButton(
                              tooltip: 'Clear history',
                              onPressed: () {
                                controller.deleteAllOrders();
                              },
                              icon: Icon(Icons.delete_outlined,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                         OrderItem()                     ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
