import 'package:eco/core/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../core/const/colors.dart';
import '../screens/check_out/check_out_screen.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CartItem extends StatelessWidget {
  CartItem({super.key});
  CartViewModel controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    extentRatio: 0.25,
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (BuildContext context) {
                          controller.deleteCard(index);
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete_outlined,
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: 110,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 110,
                            child: Image.network(
                              controller.list[index].image!,
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  text: controller.list[index].name,
                                  fontSize: 18),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text: '\$ ' +
                                    controller.list[index].price.toString(),
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 80,
                                height: 40,
                                color: Colors.grey[200],
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          controller.increaseQuantity(index);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        )),
                                    SizedBox(width: 5),
                                    FittedBox(
                                      fit: BoxFit
                                          .scaleDown, // This will scale down the text to fit
                                      child: CustomText(
                                        text: controller.list[index].quantity
                                            .toString(),
                                        fontSize: 15,
                                        color: Colors.black,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    InkWell(
                                      onTap: () {
                                        controller.decreaseQuantity(index);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(bottom: 40),
                                          child: Icon(
                                            Icons.minimize,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: controller.list.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: 'TOTAL',
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<CartViewModel>(
                      builder: (controller) => CustomText(
                            text: '\$ ${controller.totalPrice}',
                            fontSize: 15,
                            color: AppColors.primaryColor,
                          )),
                ],
              ),
              CustomButton(
                text: 'CHECKOUT',
                onTap: () {
                  Get.to(CheckoutScreen());
                },
                width: 100,
              )
            ],
          ),
        )
      ],
    );
  }
}
