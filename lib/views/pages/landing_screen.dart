import 'package:advanced_ecommerce/controllers/auth_controller.dart';
import 'package:advanced_ecommerce/services/auth_service.dart';
import 'package:advanced_ecommerce/views/pages/auth_screen.dart';
import 'package:advanced_ecommerce/views/pages/nav_bar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return StreamBuilder<User?>(
      stream: authService.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return ChangeNotifierProvider(
              create: (context) => AuthController(authService: authService),
              child: AuthScreen(),
            );
          } else {
            return NavBarScreen();
          }
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
