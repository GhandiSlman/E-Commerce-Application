import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/core/const/colors.dart';
import 'package:eco/core/helper/enum.dart';
import 'package:eco/core/view_model/cart_view_model.dart';
import 'package:eco/core/view_model/order_view_model.dart';
import 'package:eco/view/screens/check_out/add_address_screen.dart';
import 'package:eco/view/screens/order_history_screen.dart';
import 'package:eco/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/view_model/check_out_view_model.dart';
import '../../widgets/custom_text.dart';

class CheckoutScreen extends StatelessWidget {
  OrderViewModel model = Get.put(OrderViewModel());
  CartViewModel cartViewModel = Get.find();
  Delivery? delivery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => model.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            )
          : Theme(
              data: Theme.of(context).copyWith(
                  colorScheme:
                      ColorScheme.light(primary: AppColors.primaryColor)),
              child: GetBuilder<CheckoutViewModel>(
                init: CheckoutViewModel(),
                builder: (controller) => Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    CustomText(
                      text: 'CheckOut',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    Expanded(
                      child: Stepper(
                        controlsBuilder: (context, details) => Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: controller.currentStep == 0
                              ? CustomButton(
                                  width: 100,
                                  text: 'NEXT',
                                  onTap: () {
                                    controller.increaseStep();
                                  },
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomButton(
                                      width: 100,
                                      text: 'Back',
                                      color: Colors.white,
                                      textColor: AppColors.primaryColor,
                                      onTap: () {
                                        if (controller.currentStep == 1) {
                                          controller.decreaseStep();
                                          model.resetOrderInfo();
                                        } else {
                                          controller.decreaseStep();
                                        }
                                      },
                                    ),
                                    CustomButton(
                                      width: 100,
                                      text: controller.currentStep == 2
                                          ? 'FINISH'
                                          : 'NEXT',
                                      onTap: () {
                                        controller.currentStep == 2
                                            ? model.addOrder(
                                                model.street1.text,
                                                model.street2.text,
                                                model.city.text,
                                                model.state.text,
                                                model.country.text,
                                                model.delivery1.value,
                                              )
                                            : controller.increaseStep();
                                      },
                                    ),
                                  ],
                                ),
                        ),
                        elevation: 0,
                        type: StepperType.horizontal,
                        steps: controller.getSteps(),
                        currentStep: controller.currentStep.value,
                        onStepTapped: (value) => controller.decreaseStep(),
                        onStepContinue: () {
                          controller.increaseStep();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    ));
  }
}
