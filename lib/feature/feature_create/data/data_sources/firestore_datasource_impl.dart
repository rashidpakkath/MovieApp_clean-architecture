import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
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
  }

  @override
  Future<void> verifyEmail() async {
    await _auth.currentUser!.sendEmailVerification();
  }
}

@riverpod
FirebaseAuthentication firebaseAuthentication(FirebaseAuthenticationRef ref) {
  return FirebaseImpl(FirebaseAuth.instance);
}
