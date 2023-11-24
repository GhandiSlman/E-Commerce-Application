import 'package:eco/core/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const/colors.dart';
import '../../../core/helper/enum.dart';
import '../../widgets/custom_text.dart';

class DeliveryTimeScreen extends StatelessWidget {
  OrderViewModel orderViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => RadioListTile<Delivery>(
              value: Delivery.StandardDelivery,
              groupValue: orderViewModel.delivery1.value,
              onChanged: (Delivery? val) {
                orderViewModel.updateDelivery(val!);
              },
              title: CustomText(
                text: 'Standard delivery',
                fontSize: 18,
              ),
              activeColor: AppColors.primaryColor,
              subtitle: CustomText(
                text: '\nOrder will be delivered between 3 - 5 business days',
              ),
            )),
        SizedBox(height: 30),
        Obx(() => RadioListTile<Delivery>(
              value: Delivery.NextDayDalivery,
              groupValue: orderViewModel.delivery1.value,
              onChanged: (Delivery? val) {
                orderViewModel.updateDelivery(val!);
              },
              title: CustomText(
                text: 'Next Day Delivery',
                fontSize: 18,
              ),
              activeColor: AppColors.primaryColor,
              subtitle: CustomText(
                text:
                    '\nPlace your order before 6pm and your items will be delivered the next day',
              ),
            )),
        SizedBox(height: 30),
        Obx(() => RadioListTile<Delivery>(
              value: Delivery.NominatedDelivery,
              groupValue: orderViewModel.delivery1.value,
              onChanged: (Delivery? val) {
                orderViewModel.updateDelivery(val!);
              },
              title: CustomText(
                text: 'Nominated Delivery',
                fontSize: 18,
              ),
              activeColor: AppColors.primaryColor,
              subtitle: CustomText(
                text:
                    '\nPick a particular date from the calendar and order will be delivered on selected date',
              ),
            )),
      ],
    );
  }
}
