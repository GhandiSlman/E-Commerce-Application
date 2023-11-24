import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hint;
  final Icon icon;

  const CustomTextForm({super.key, required this.hint,required this.icon});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(
       hintText: hint,
       suffixIcon: icon,
       
      ),
    );
  }
}
