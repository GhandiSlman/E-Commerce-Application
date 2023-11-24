import 'package:eco/core/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../core/const/colors.dart';
import '../../core/view_model/cart_view_model.dart';
import '../screens/details_screen.dart';
import 'custom_text.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem({super.key});
  CartViewModel controller = Get.find();
  HomeViewModel homeViewModel = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
        child: Column(
          children: [
            const CustomText(
              text: 'My favorite products',
              fontSize: 20,
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.favorite.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items per row
                crossAxisSpacing: 10, // Horizontal space between items
                mainAxisSpacing: 10, // Vertical space between items
                childAspectRatio: 0.5, // Aspect ratio of each item
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image.network(
                            controller.favorite[index].image!,
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: 200,
                          ),
                          Positioned(
                            top: 2,
                            left: 2,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                tooltip: 'UnFavorite',
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  controller.deleteFavorite(index);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomText(
                      text: controller.favorite[index].name!,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: "${controller.favorite[index].price!} \$",
                      alignment: Alignment.bottomLeft,
                      color: AppColors.primaryColor,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
