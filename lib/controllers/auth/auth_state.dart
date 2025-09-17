import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  List<Object?> get props => [];
}

class AuthInit extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User? user;

  AuthAuthenticated({required this.user});
  @override
  List<Object?> get props => [user];
}

class AuthUnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});

  @override
  List<Object?> get props => [error];
}
