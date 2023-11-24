import 'package:eco/core/view_model/all_products_view_model.dart';
import 'package:eco/core/view_model/cart_view_model.dart';
import 'package:eco/core/view_model/home_view_model.dart';
import 'package:eco/core/view_model/category_products_view_model.dart';
import 'package:eco/model/category_model.dart';
import 'package:eco/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../core/const/colors.dart';
import '../../model/cart_model.dart';
import '../widgets/favorite_item.dart';
import 'details_screen.dart';

class MyFavoriteScreen extends StatelessWidget {
  HomeViewModel homeViewModel = Get.find();
  MyFavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
  
      builder: (controller) => Scaffold(
          backgroundColor: Colors.white,
          body: controller.favorite.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/category.png'),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: 'No Favorites',
                      fontSize: 20,
                    ),
                  ],
                )
              : FavoriteItem()),
    );
  }
}
