import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../core/const/colors.dart';
import '../../core/view_model/home_view_model.dart';
import '../screens/details_screen.dart';
import 'custom_text.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.searchList.isEmpty &&
              controller.isSearching
          ? Padding(
              padding: const EdgeInsets.only(top: 120),
              child: CustomText(
                text: 'No results found.',
                color: Colors.grey,
              ),
            )
          : Container(
              height: 250,
              child: ListView.separated(
                itemCount: controller.isSearching
                    ? controller.searchList.length
                    : controller.productModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(DetailsScreen(
                        model: controller.isSearching
                            ? controller.searchList[index]
                            : controller.productModel[index],
                      ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[100]),
                            width: MediaQuery.of(context).size.width * .4,
                            child: Container(
                                width: MediaQuery.of(context).size.width * .4,
                                height: 180,
                                child: Image.network(
                                  controller.isSearching
                                      ? controller.searchList[index].image!
                                      : controller.productModel[index].image!,
                                  fit: BoxFit.fill,
                                )),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomText(
                            text: controller.isSearching
                                ? controller.searchList[index].name!
                                : controller.productModel[index].name!,
                            alignment: Alignment.bottomLeft,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: controller.isSearching
                                ? controller.searchList[index].desc!
                                : controller.productModel[index].desc!,
                            alignment: Alignment.bottomLeft,
                            color: Colors.grey,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: controller.isSearching
                                ? controller.searchList[index].price!
                                : controller.productModel[index].price! + " \$",
                            alignment: Alignment.bottomLeft,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
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
