import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthentication {
  Future<UserCredential> signUp(
    final String email,
    final String password,
  );
  Future<UserCredential> signIn(
    final String email,
    final String password,
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
