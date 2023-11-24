import 'package:eco/core/const/colors.dart';
import 'package:eco/core/view_model/cart_view_model.dart';
import 'package:eco/model/cart_model.dart';
import 'package:eco/model/product_model.dart';
import 'package:eco/view/screens/check_out/check_out_screen.dart';
import 'package:eco/view/widgets/cart_item.dart';
import 'package:eco/view/widgets/custom_button.dart';
import 'package:eco/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../core/view_model/home_view_model.dart';

class CartScreen extends StatelessWidget {
  CartScreen({ super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: controller.list.isEmpty
            ? Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Image.asset('assets/empty_cart.png')),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: 'Cart Empty',
                    fontSize: 20,
                  )
                ],
              )
            : CartItem()
      ),
    );
  }
}
