import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/const/colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final double? width;
  final double? height;
  final Color ?color;
  final Color ?textColor;
  void Function()? onTap;
  CustomButton({this.height = 40,this.color = AppColors.primaryColor,this.textColor = Colors.white,this.width, this.text, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        width: width,
        height: height,
        child: CustomText(
          text: text,
          
          color: textColor,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
