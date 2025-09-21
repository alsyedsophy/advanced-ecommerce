import 'package:advanced_ecommerce/controllers/auth/auth_cubit.dart';
import 'package:advanced_ecommerce/controllers/auth/auth_state.dart';

import 'package:advanced_ecommerce/views/pages/auth_screen.dart';
import 'package:advanced_ecommerce/views/pages/main%20screens/nav_bar_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is AuthError) {
          return Scaffold(
            body: Center(child: Text("===========${state.error}")),
          );
        }
        if (state is AuthUnAuthenticated || state is AuthInit) {
          return AuthScreen();
        }
        return NavBarScreen();
      },
    );
  }
}
