import 'package:eco/core/view_model/cart_view_model.dart';
import 'package:eco/core/view_model/home_view_model.dart';
import 'package:eco/model/product_model.dart';
import 'package:eco/view/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../view/screens/cart_screen.dart';
import '../../view/screens/profile_screen.dart';

class ControlViewModel extends GetxController {
  HomeViewModel homeViewModel = Get.put(HomeViewModel());
  int _navigatorValue = 0;
  Widget _currentScreen = HomeScreen();
  get navigatorValue => _navigatorValue;
  get currentScreen => _currentScreen;
  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeScreen(
          );
          break;
        }
      case 1:
        {
          _currentScreen = CartScreen(
          );
          break;
        }
      case 2:
        {
          _currentScreen = ProfileScreen();
          break;
        }

      default:
    }
    update();
  }
}
