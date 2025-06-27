import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {

  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final VoidCallback? onFilterPressed;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search',
        filled: true,
        fillColor: AppColors.beige,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.defaultPadding,
          vertical: AppSizes.defaultPadding / 2,
        ),
        suffixIcon: GestureDetector(
        onTap: onFilterPressed,
        child: CircleAvatar(
          backgroundColor: AppColors.salmon,
          child: Icon(Icons.filter_list, color: AppColors.white),
        ),
      ),

    ),
      style: AppStyles.bodyStyle,
    );
  }
}