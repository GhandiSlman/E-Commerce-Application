import 'package:eco/core/const/colors.dart';
import 'package:eco/core/view_model/cart_view_model.dart';
import 'package:eco/core/view_model/check_out_view_model.dart';
import 'package:eco/core/view_model/order_view_model.dart';
import 'package:eco/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/summery_screen.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({super.key});
  OrderViewModel orderViewModel = Get.find();
  @override
  Widget build(BuildContext context) {
    return 
    GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => Column(
        children: [
          Container(
            height: 230,
            //  color: Colors.red,
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child:SummeryItem()
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: 'Shipping Address',
            fontSize: 18,
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: 10,
          ),
          GetBuilder<CheckoutViewModel>(
            builder: (controller) => CustomText(
              text:
                  '${controller.street1}, ${controller.street2}, ${controller.city}, ${controller.state}, ${controller.country}',
              fontSize: 20,
              color: Colors.grey,
              alignment: Alignment.topLeft,
            ),
          )
        ],
      ),
    );
  }
}
