import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String? text;
  void Function()? onTap;
  final String ? imageName;
  CustomButtonSocial({this.imageName,this.text, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white24,
            border: Border.all(color: Color.fromARGB(255, 219, 219, 219))),
        width: double.infinity,
        height: 40,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(11),
              child: Image.asset(imageName!),
            ),
            SizedBox(
              width: 70,
            ),
            CustomText(
              text: text,
              //color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
