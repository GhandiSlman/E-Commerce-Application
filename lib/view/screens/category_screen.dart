import 'package:eco/core/view_model/home_view_model.dart';
import 'package:eco/core/view_model/category_products_view_model.dart';
import 'package:eco/model/category_model.dart';
import 'package:eco/view/widgets/custom_text.dart';
import 'package:eco/view/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/const/colors.dart';
import '../widgets/category_product_item.dart';
import 'details_screen.dart';

class CategoryScreen extends StatelessWidget {
  CategoryModel? model;
  CategoryScreen({this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryProductsViewModel>(
      init: CategoryProductsViewModel(),
      builder: (controller)=>
      Scaffold(
        backgroundColor: Colors.white,
          body:
          controller.isLoading 
      ? const Shimmerr()
      : controller.categoryProduct.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/category.png'),
                const SizedBox(height: 10),
                const CustomText(
                  text: 'No Products',
                  fontSize: 20,
                ),
              ],
            )
          :
          SingleChildScrollView(
            child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                  child: Column(
            children: [
              CustomText(
                text: model!.name,
                fontSize: 20,
              ),
               CategoryProductItem()    
            ],
                  ),
                ),
          )),
    );
  }
}
