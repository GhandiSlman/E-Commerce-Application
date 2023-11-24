import 'package:eco/core/const/colors.dart';
import 'package:eco/core/view_model/auth_view_model.dart';
import 'package:eco/view/screens/auth/sign_up_screen.dart';
import 'package:eco/view/widgets/custom_button.dart';
import 'package:eco/view/widgets/custom_button_social.dart';
import 'package:eco/view/widgets/custom_text.dart';
import 'package:eco/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  LoginScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 70,
          left: 20,
          right: 20,
        ),
        child: GetBuilder<AuthViewModel>(
          builder: (controller) =>
          controller.isLoading?Center(
            child: CircularProgressIndicator(
            color: AppColors.primaryColor,
                  ),
          ):  ListView(
            children: [
              Form(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(fontSize: 30, text: 'Welcom!'),
                      GestureDetector(
                        onTap: () {
                          Get.to(SignUpScreen());
                        },
                        child: CustomText(
                          fontSize: 18,
                          text: 'Sign up!',
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                    text: 'sign in to continue',
                    color: Colors.grey,
                    fontSize: 14,
                    alignment: Alignment.topLeft,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    mycontroller: controller.email,
                    hint: 'iamdavid@gmail.com',
                    text: 'Email',
                    // onSaved: (val) {
                    //   controller.email = val;
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    mycontroller: controller.password,
                    hint: '************',
                    text: 'Password',
                    // onSaved: (val) {
                    //   controller.password = val;
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                    text: 'Forget password?',
                    alignment: Alignment.topRight,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: 'SIGN IN',
                    onTap: () {
                      controller.signInWithEmailAndPassword();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: '-OR-',
                    alignment: Alignment.center,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButtonSocial(
                    imageName: 'assets/google (1).png',
                    text: 'Sign in with google',
                    onTap: () {
                      controller.signInWithGoogle();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButtonSocial(
                    imageName: 'assets/facebook.png',
                    text: 'Sign in with facebook',
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
