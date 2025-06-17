import 'package:flutter/material.dart';
import 'package:nawel/app/app_colors.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: AppColors.iconGrey),
        filled: true,
        fillColor: AppColors.inputFillGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
