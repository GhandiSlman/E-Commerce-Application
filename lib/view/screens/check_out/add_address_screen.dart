import 'package:eco/core/view_model/check_out_view_model.dart';
import 'package:eco/core/view_model/order_view_model.dart';
import 'package:eco/view/widgets/custom_text.dart';
import 'package:eco/view/widgets/custom_text_form_field.dart';
import 'package:eco/view/widgets/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/view_model/cart_view_model.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderViewModel model = Get.find();
    return GetBuilder<CheckoutViewModel>(
      builder: (controller) => Form(
        key: controller.formState,
        child: Column(
          children: [
            CustomText(
              text: 'Billing address is the same as delivery address',
              fontSize: 14,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              onSaved: (val) {
                controller.street1 = val!;
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "can't be empty";
                }
              },
              mycontroller: model.street1,
              text: 'Street 1',
              hint: '21,Alex Davidson Avenue',
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              onSaved: (val) {
                controller.street2 = val!;
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "can't be empty";
                }
              },
              mycontroller: model.street2,
              text: 'Street 2',
              hint: 'Opposite Omegatron, Vicent Quarters',
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              onSaved: (val) {
                controller.city = val!;
              },
              mycontroller: model.city,
              validator: (val) {
                if (val!.isEmpty) {
                  return "can't be empty";
                }
              },
              text: 'City',
              hint: 'Victoria Island',
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomTextFormField(
                      onSaved: (val) {
                        controller.state = val!;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "can't be empty";
                        }
                      },
                      mycontroller: model.state,
                      text: 'State',
                      hint: 'Lagos State',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomTextFormField(
                      onSaved: (val) {
                        controller.country = val!;
                      },
                      mycontroller: model.country,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "can't be empty";
                        }
                      },
                      text: 'Country',
                      hint: 'Syria',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
