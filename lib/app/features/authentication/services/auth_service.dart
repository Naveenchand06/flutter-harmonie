import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_player/app/features/authentication/state/auth_result.dart';

class AuthService {
  String? get userId => FirebaseAuth.instance.currentUser?.uid;
  bool get isAlreadyloggedIn => userId != null;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  String? get email => FirebaseAuth.instance.currentUser?.email;

  // * Register User
  Future<AuthResult> register({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }

  // * Log in User
  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
