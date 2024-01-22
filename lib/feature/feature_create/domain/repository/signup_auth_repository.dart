import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> signupWithEmail(
    String email,
    String password,
  );
  Future<UserCredential> singinWithEmail(
    String email,
    String password,
  );
  Future<void> signOut();
  Future<void> verifyEmail();
  Future<void> googleSignIn();
  Future<void> resetPassword(
    String email,
  );
  Future<(String, int?)> phoneNumberSignIn(
    String number,
  );
  Future<void> verifyOtp(String verificationId, String otp);
}
