import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final Alignment? alignment;
  final int? maxLines;
  final double? height;
  const CustomText({
    this.height,
    this.alignment
    ,this.color, this.fontSize, this.text,this.maxLines, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        maxLines: maxLines,
        text!,
        style: TextStyle(
          height: height,
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
