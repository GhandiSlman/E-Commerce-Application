import 'package:eco/core/view_model/auth_view_model.dart';
import 'package:eco/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../core/const/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_button_social.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';

class SignUpScreen extends GetWidget<AuthViewModel> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginScreen());
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: GetBuilder<AuthViewModel>(
          builder: ( controller) =>
           controller.isLoading?Center(child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        )):ListView(children: [
            const CustomText(
              fontSize: 30,
              text: 'Sign Up',
              alignment: Alignment.topLeft,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextFormField(
              hint: 'Enter your name',
              text: 'Name',
              mycontroller: controller.name,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hint: 'Enter your email',
              text: 'Email',
              mycontroller: controller.email,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hint: 'Enter your password',
              text: 'Password',
              mycontroller: controller.password,
            ),
            SizedBox(
              height: 100,
            ),
            CustomButton(
              text: 'SIGN UP',
              onTap: () {
                controller.createAccountWithEmailAndPassword();
              },
            ),
          ]),
        ),
      ),
    );
  }
}
