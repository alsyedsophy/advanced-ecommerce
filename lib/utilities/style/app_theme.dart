import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.primaryBlackColor,
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
    ),
  );
}
