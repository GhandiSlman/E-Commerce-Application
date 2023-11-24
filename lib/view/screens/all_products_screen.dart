import 'package:eco/core/view_model/all_products_view_model.dart';
import 'package:eco/model/product_model.dart';
import 'package:eco/view/widgets/all_products_item.dart';
import 'package:eco/view/widgets/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/const/colors.dart';
import '../../core/view_model/home_view_model.dart';

import '../widgets/custom_text.dart';
import 'details_screen.dart';

class AllProductsScreen extends StatelessWidget {
  ProductModel? model;

  AllProductsScreen({this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AllProductsViewModel>(
        init: AllProductsViewModel(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Persistent Search field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200),
                      child: TextFormField(
                        onChanged: (value) {
                          controller.searchProducts(value);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search by name',
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Checking for No Results
                  if (controller.isSearching && controller.searchList.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'No results found.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),

                  // Displaying Grid of Products or Search Results
                  if (!controller.isSearching || controller.searchList.isNotEmpty)
                   controller.isLoading == true?const Shimmerr(): AllProductsItem()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

