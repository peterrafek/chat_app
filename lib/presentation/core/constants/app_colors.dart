import 'package:flutter/material.dart';

class AppColors {
  static const white = Colors.white;
  static const black = Colors.black;
  static const salmon = Color(0xFFFA8072);
  static const terracotta = Color(0xFFE2725B);
  static const brownRosy = Color(0xFFBC8F8F);
  static const beige = Color(0xFFF5F5DC);
  static const darkOrange = Color(0xFFFF8C00);
  static const textColor = black;
}

class AppStyles {
  static const headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const bodyStyle = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );
  static const buttonStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}

class AppSizes {
  static const defaultPadding = 16.0;
  static const buttonHeight = 48.0;
  static const iconSize = 24.0;
}