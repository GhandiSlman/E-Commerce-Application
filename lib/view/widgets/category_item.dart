import 'package:eco/core/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../model/category_model.dart';
import '../screens/category_screen.dart';
import 'custom_text.dart';

class CategoryItem extends StatelessWidget {

  CategoryItem({super.key,});

  HomeViewModel homeViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(
                    CategoryScreen(
                      model: controller.categoryModel[index],
                    ),
                    arguments: {'id': controller.categoryModel[index].id});
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[100]),
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child:
                          Image.network(controller.categoryModel[index].image!),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(text: controller.categoryModel[index].name)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
