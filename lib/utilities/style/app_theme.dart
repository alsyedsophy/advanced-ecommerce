import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,

    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
    ),
  );
}
