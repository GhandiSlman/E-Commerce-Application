import 'package:eco/core/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../core/const/colors.dart';
import 'custom_text.dart';

class OrderItem extends StatelessWidget {
  OrderItem({super.key});
  OrderViewModel controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.orderModel.length,
        itemBuilder: (context, orderIndex) {
          final order = controller.orderModel[orderIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    endIndent: 30,
                    indent: 30,
                    color: Colors.blueGrey[800],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blueGrey.shade100,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primaryColor,
                          ),
                          CustomText(
                            text: controller.orderModel[orderIndex].street1,
                            color: Colors.grey,
                          ),
                          CustomText(
                            text: controller.orderModel[orderIndex].street2,
                            color: Colors.grey,
                          ),
                          CustomText(
                            text: controller.orderModel[orderIndex].city,
                            color: Colors.grey,
                          ),
                          CustomText(
                            text: controller.orderModel[orderIndex].state,
                            color: Colors.grey,
                          ),
                          CustomText(
                            text: controller.orderModel[orderIndex].country,
                            color: Colors.grey,
                          ),
                        ]),
                  ),
                ),
              ),
              ...order.products!.map((product) {
                return InkWell(
                  onTap: () {
                    //   Get.to(OrderDetailsScreen(order: order));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.blueGrey.shade100,
                        width: 1,
                      ),
                    ),
                    height: 110,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 110,
                          width: 110,
                          child: Image.network(
                            product.image!,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: product.name,
                                fontSize: 18,
                              ),
                              SizedBox(height: 10),
                              CustomText(
                                text: '\$ ${product.price}',
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(height: 10),
                              CustomText(
                                text: 'Quantity: ${product.quantity}',
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
