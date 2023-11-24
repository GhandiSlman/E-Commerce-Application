import 'package:eco/core/const/colors.dart';
import 'package:eco/core/view_model/control_view_model.dart';
import 'package:eco/core/view_model/home_view_model.dart';

import 'package:eco/model/category_model.dart';
import 'package:eco/model/product_model.dart';
import 'package:eco/view/screens/all_products_screen.dart';
import 'package:eco/view/screens/auth/login_screen.dart';
import 'package:eco/view/screens/category_screen.dart';
import 'package:eco/view/screens/details_screen.dart';
import 'package:eco/view/widgets/category_item.dart';
import 'package:eco/view/widgets/custom_text.dart';
import 'package:eco/view/widgets/product_item.dart';
import 'package:eco/view/widgets/shimmer_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.isLoading.value
          ? const ShimmerHomeScreen()
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 70, right: 20, left: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200),
                        child: TextFormField(
                          // keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            controller.searchProducts(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search by name',
                            prefixIcon: Icon(
                              CupertinoIcons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: 'Categories',
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CategoryItem(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Best Selling',
                            fontSize: 18,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(
                                  AllProductsScreen(

                                      // model: controller.productModel[0],
                                      ),
                                  arguments: {
                                    'id': controller.productModel[0].id
                                  });
                            },
                            child: CustomText(
                              text: 'See All',
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProductItem(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
