import 'dart:developer';

import 'package:advanced_ecommerce/core/locator.dart';
import 'package:advanced_ecommerce/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final FirestoreService _firestoreService = locator<FirestoreService>();

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
      // log("===============================");
      // log(e.toString());
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
      if (result.user != null) {
        log(result.user!.uid);
        await _firestoreService.setData(
          path: 'users/${result.user!.uid}',
          data: {'uid': result.user!.uid, 'email': email},
        );
      }
      return result.user;
    } catch (e) {
      // log(e.toString());
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
      // log(e.toString());
    }
  }
}
