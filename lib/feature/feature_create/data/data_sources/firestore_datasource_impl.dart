import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/core/excepation/authentication/auth_field_excepation.dart';
import 'package:movie_app/feature/feature_create/data/data_sources/firestore_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_datasource_impl.g.dart';

class FirebaseImpl implements FirebaseAuthentication {
  final FirebaseAuth _auth;
  FirebaseImpl(this._auth);
  @override
  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationFailedException('Wrong email address');
      } else if (e.code == 'wrong-password') {
        throw AuthenticationFailedException('Wrong password');
      } else if (e.code == 'user-disabled') {
        throw AuthenticationFailedException('User is disabled. Cannot login');
      } else {
        throw AuthenticationFailedException('Cannot login. Please try again');
      }
    }
  }

  @override
  Future<UserCredential> signUp(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationFailedException(
            'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthenticationFailedException(
            'The account already exists for this email.');
      } else {
        throw AuthenticationFailedException('Cannot signup. Please try again');
      }
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Future<void> verifyEmail() async {
    if (_auth.currentUser != null) {
      await _auth.currentUser!.sendEmailVerification();
    } else {
      throw AuthenticationFailedException('User is not Authenticate');
    }
  }

  @override
  Future<void> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<(String, int?)> phoneNumberSignIn(String phone,
      [int? resendToken]) async {
    try {
      final verificationIdCompleter = Completer<String>();
      final resendTokenCompleter = Completer<int?>();
      await FirebaseAuth.instance.verifyPhoneNumber(
        forceResendingToken: resendToken,
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {}
        },
        codeSent: (String? verificationId, int? resendToken) async {
          verificationIdCompleter.complete(verificationId);
          resendTokenCompleter.complete(resendToken);
        },
        codeAutoRetrievalTimeout: (String verificationId) async {},
      );
      final verificationId = await verificationIdCompleter.future;
      final newResendToken = await resendTokenCompleter.future;
      return (verificationId, newResendToken);
    } on Exception {
      throw AuthenticationFailedException('Error');
    }
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}

@riverpod
FirebaseAuthentication firebaseAuthentication(FirebaseAuthenticationRef ref) {
  return FirebaseImpl(FirebaseAuth.instance);
}
