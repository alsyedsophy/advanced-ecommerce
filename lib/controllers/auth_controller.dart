import 'package:advanced_ecommerce/services/auth_service.dart';
import 'package:advanced_ecommerce/utilities/enum.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final AuthService authService;
  String email;
  String password;
  AuthFormType authFormType;

  AuthController({
    required this.authService,
    this.email = "",
    this.password = "",
    this.authFormType = AuthFormType.login,
  });

  void copyWith({String? email, String? password, AuthFormType? authFormType}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }

  updateEmail(String email) => copyWith(email: email);
  updatePassword(String password) => copyWith(password: password);

  toggelFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWith(authFormType: formType, email: '', password: '');
  }

  Future<void> supmit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await authService.loginWithEmailAndPassword(email, password);
      } else {
        await authService.signupWithEmailAndPAssword(email, password);
      }
    } catch (e) {
      rethrow;
    }
  }
}
