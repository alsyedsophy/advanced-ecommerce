import 'package:advanced_ecommerce/controllers/auth/auth_cubit.dart';
import 'package:advanced_ecommerce/controllers/cart/cart_cubit.dart';
import 'package:advanced_ecommerce/controllers/product/product_cubit.dart';
import 'package:advanced_ecommerce/controllers/shipping%20address/shipping_cubit.dart';
import 'package:advanced_ecommerce/core/locator.dart';
import 'package:advanced_ecommerce/firebase_options.dart';
import 'package:advanced_ecommerce/services/auth_service.dart';
import 'package:advanced_ecommerce/utilities/routing/config_routing.dart';
import 'package:advanced_ecommerce/utilities/style/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 875),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(locator<AuthServiceImpl>()),
          ),
          BlocProvider(create: (context) => ProductCubit()),
          BlocProvider(create: (context) => CartCubit()),
          BlocProvider(create: (context) => ShippingCubit()),
        ],
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
