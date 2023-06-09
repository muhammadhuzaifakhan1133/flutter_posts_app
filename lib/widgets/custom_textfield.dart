import 'package:flutter/material.dart';
import 'package:test1/utils/extensions.dart';
import 'package:test1/widgets/color_constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintText;
  final String? errorText;
  Widget? suffixIcon;
  bool obscureText;
  final Function(String)? onChanged;
  CustomTextField(
      {super.key,
      this.textEditingController,
      this.hintText,
      this.errorText,
      this.onChanged,
      this.obscureText = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.8,
      child: TextField(
        controller: textEditingController,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorText: errorText,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: ColorConstants.transparent)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: ColorConstants.transparent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: ColorConstants.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: ColorConstants.transparent)),
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: ColorConstants.textfieldColor,
          filled: true,
        ),
      ),
    );
  }
}
