import 'package:advanced_ecommerce/utilities/routing/config_routing.dart';
import 'package:advanced_ecommerce/utilities/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 875),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'E commerce',
        theme: AppTheme.lightTheme,
        routerConfig: ConfigRouting.goRouter,
      ),
    );
  }
}
