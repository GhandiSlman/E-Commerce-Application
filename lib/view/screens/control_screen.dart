import 'package:eco/core/view_model/auth_view_model.dart';
import 'package:eco/view/screens/auth/login_screen.dart';
import 'package:eco/view/screens/cart_screen.dart';
import 'package:eco/view/screens/home_screen.dart';
import 'package:eco/view/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../core/view_model/control_view_model.dart';

class ControlScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
    FirebaseAuth.instance.currentUser == null
        ? LoginScreen()
        : 
        GetBuilder<ControlViewModel>(
         init: ControlViewModel(),
          builder:(controller) 
        
          => Scaffold(
            body: controller.currentScreen,
            bottomNavigationBar: bottomNavigationBar(),
          ),
        );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text('Explore'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 15,
                ),
              )),
          BottomNavigationBarItem(
              
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text('Cart'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/Icon_Cart.png',
                  fit: BoxFit.contain,
                  width: 15,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text('Account'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/Icon_User.png',
                  fit: BoxFit.contain,
                  width: 15,
                ),
              )),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey[50],
      ),
    );
  }
}
