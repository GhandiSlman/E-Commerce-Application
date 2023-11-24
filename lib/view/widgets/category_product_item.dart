import 'package:eco/core/view_model/category_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../core/const/colors.dart';
import '../screens/details_screen.dart';
import 'custom_text.dart';

class CategoryProductItem extends StatelessWidget {
  CategoryProductItem({super.key});
  CategoryProductsViewModel controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: controller.categoryProduct.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10, 
        childAspectRatio: 0.5,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(DetailsScreen(
              model: controller.categoryProduct[index],
            ));
          },
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  controller.categoryProduct[index].image!,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 8),
              CustomText(
                text: controller.categoryProduct[index].name!,
                alignment: Alignment.bottomLeft,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: controller.categoryProduct[index].desc!,
                alignment: Alignment.bottomLeft,
                color: Colors.grey,
                maxLines: 1,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: "${controller.categoryProduct[index].price!} \$",
                alignment: Alignment.bottomLeft,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
