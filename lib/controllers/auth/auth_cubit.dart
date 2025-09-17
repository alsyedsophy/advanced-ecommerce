import 'package:advanced_ecommerce/controllers/auth/auth_state.dart';
import 'package:advanced_ecommerce/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  AuthCubit(this._authService) : super(AuthInit()) {
    _authService.authStateChanges.listen((user) {
      if (user != null) {
        emit(AuthAuthenticated(user: user));
      } else {
        emit(AuthUnAuthenticated());
      }
    });
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await _authService.loginWithEmailAndPassword(email, password);
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> signup(String email, String password) async {
    emit(AuthLoading());
    try {
      await _authService.signupWithEmailAndPAssword(email, password);
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await _authService.signout();
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
