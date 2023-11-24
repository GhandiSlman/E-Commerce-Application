import 'package:eco/core/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../core/const/colors.dart';
import 'custom_text.dart';

class SummeryItem extends StatelessWidget {
  SummeryItem({super.key});
  CartViewModel controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 150,
          child: Column(
            children: [
              SizedBox(
                height: 180,
                width: 150,
                child: Image.network(
                  controller.list[index].image!,
                  fit: BoxFit.fitWidth,
                ),
              ),
              CustomText(
                  alignment: Alignment.bottomLeft,
                  text: controller.list[index].name),
              SizedBox(
                height: 10,
              ),
              CustomText(
                alignment: Alignment.bottomLeft,
                text: '\$ ${controller.list[index].price}',
                color: AppColors.primaryColor,
              ),
            ],
          ),
        );
      },
      itemCount: controller.list.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 10,
        );
      },
    );
  }
}
