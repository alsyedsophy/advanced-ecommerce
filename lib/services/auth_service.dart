import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<User?> signupWithEmailAndPAssword(String email, String password);
  User? get getCurrentUser;
  Stream<User?> authStateChanges();
}

class AuthServiceImpl extends AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User? get getCurrentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final user = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user;
  }

  @override
  Future<User?> signupWithEmailAndPAssword(
    String email,
    String password,
  ) async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user;
  }

  @override
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}
