import 'package:flutter/material.dart';
import 'package:test1/utils/extensions.dart';
import 'package:test1/widgets/color_constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const CustomButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: ColorConstants.primaryColor,
          minimumSize: Size(context.width * 0.8, 50)),
      child: Text(buttonText, style: const TextStyle(fontSize: 18)),
    );
  }
}
