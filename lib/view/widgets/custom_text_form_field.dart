import 'package:eco/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String? hint;
  void Function(String?)? onSaved;
  final TextEditingController? mycontroller;
  String? Function(String?)? validator;
   CustomTextFormField(
      {this.mycontroller,this.hint, this.onSaved, this.text, this.validator, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            alignment: Alignment.topLeft,
            text: text,
            fontSize: 14,
            color: Colors.grey.shade800,
          ),
          TextFormField(
            controller: mycontroller,
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
