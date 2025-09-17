import 'package:advanced_ecommerce/firebase_options.dart';
import 'package:advanced_ecommerce/services/auth_service.dart';
import 'package:advanced_ecommerce/utilities/routing/config_routing.dart';
import 'package:advanced_ecommerce/utilities/style/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 875),
      builder: (context, child) => Provider<AuthService>(
        create: (_) => AuthServiceImpl(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'E commerce',
          theme: AppTheme.lightTheme,
          routerConfig: ConfigRouting.goRouter,
        ),
      ),
    );
  }
}
