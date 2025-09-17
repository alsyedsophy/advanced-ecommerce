import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<User?> signupWithEmailAndPAssword(String email, String password);
  User? get getCurrentUser;
  Stream<User?> get authStateChanges;

  Future<void> signout();
}

class AuthServiceImpl extends AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User? get getCurrentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<User?> signupWithEmailAndPAssword(
    String email,
    String password,
  ) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future<void> signout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
