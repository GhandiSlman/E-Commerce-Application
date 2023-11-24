import 'package:eco/core/view_model/home_view_model.dart';
import 'package:eco/core/view_model/order_view_model.dart';
import 'package:eco/core/view_model/profile_view_model.dart';
import 'package:eco/model/cart_model.dart';
import 'package:eco/view/screens/auth/login_screen.dart';
import 'package:eco/view/screens/my_favorite_screen.dart';
import 'package:eco/view/screens/order_history_screen.dart';
import 'package:eco/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../core/const/colors.dart';
import '../../model/order_model.dart';

class ProfileScreen extends StatelessWidget {
  HomeViewModel homeViewModel = Get.find();
  OrderViewModel orderViewModel = Get.put(OrderViewModel());
  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            )
          : Scaffold(
              body: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CustomText(
                            text: controller.model.name,
                            color: AppColors.primaryColor,
                            fontSize: 20,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: controller.model.email,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      MyFavoriteScreen(),
                    );
                  },
                  child: ListTile(
                    leading: Padding(
                      padding:
                          const EdgeInsets.only(top: 17, right: 17, bottom: 17),
                      child: Image.asset('assets/favorite.png'),
                    ),
                    title: CustomText(
                      text: 'My favorite',
                    ),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(OrderHistoryScreen());
                  },
                  child: ListTile(
                    leading: Padding(
                      padding:
                          const EdgeInsets.only(top: 17, right: 17, bottom: 17),
                      child: Image.asset('assets/project-management.png'),
                    ),
                    title: CustomText(
                      text: 'Order History',
                    ),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.signOut();
                  },
                  child: ListTile(
                    leading: Padding(
                      padding:
                          const EdgeInsets.only(top: 17, right: 17, bottom: 17),
                      child: Image.asset('assets/exit.png'),
                    ),
                    title: CustomText(
                      text: 'Log Out',
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                    ),
                  ),
                ),
              ]),
            )),
    );
  }
}
