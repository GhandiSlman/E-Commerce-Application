import 'package:eco/view/screens/check_out/deleivery_time_screen.dart';
import 'package:eco/view/screens/check_out/summery_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screens/check_out/add_address_screen.dart';

class CheckoutViewModel extends GetxController {
  RxInt currentStep = 0.obs;

  String street1 = '';
  String street2 = '';
  String city = '';
  String state = '';
  String country = '';
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  

  increaseStep() {
    if (currentStep.value == 1) {  
      formState.currentState!.save();
      if (!formState.currentState!.validate()) {
        return; 
      }
    }
    if (currentStep.value < getSteps().length - 1) {
      currentStep.value++;
    } else {
      print('Complete');
    }

    update();
  }

  decreaseStep() {
    currentStep == 0 ? print('Compete') : currentStep--;
    update();
  }

  List<Step> getSteps() => [
        Step(
            title: Divider(),
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            label: Text('Delivery'),
            content: DeliveryTimeScreen()),
        Step(
            title: Divider(),
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            label: Text('Address'),
            content: AddAddressScreen()),
        Step(
            title: Divider(),
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            label: Text('Summery'),
            content: SummaryScreen()),
      ];
}
