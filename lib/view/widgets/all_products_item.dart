import 'package:eco/core/view_model/all_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../core/const/colors.dart';
import '../screens/details_screen.dart';
import 'custom_text.dart';

class AllProductsItem extends StatelessWidget {
  AllProductsItem({super.key});
  AllProductsViewModel controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: controller.isSearching
          ? controller.searchList.length
          : controller.allProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items per row
        crossAxisSpacing: 10, // Horizontal space between items
        mainAxisSpacing: 10, // Vertical space between items
        childAspectRatio: 0.5, // Aspect ratio of each item
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(DetailsScreen(
              model: controller.isSearching
                  ? controller.searchList[index]
                  : controller.allProducts[index],
            ));
          },
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  controller.isSearching
                      ? controller.searchList[index].image!
                      : controller.allProducts[index].image!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              const SizedBox(height: 8),
              CustomText(
                text: controller.isSearching
                    ? controller.searchList[index].name!
                    : controller.allProducts[index].name!,
                alignment: Alignment.bottomLeft,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: controller.isSearching
                    ? controller.searchList[index].desc!
                    : controller.allProducts[index].desc!,
                alignment: Alignment.bottomLeft,
                color: Colors.grey,
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text:
                    "${controller.isSearching ? controller.searchList[index].price! : controller.allProducts[index].price!} \$",
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
