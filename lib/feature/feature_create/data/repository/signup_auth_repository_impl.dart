import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/feature/feature_create/data/data_sources/firestore_datasource.dart';
import 'package:movie_app/feature/feature_create/data/data_sources/firestore_datasource_impl.dart';
import 'package:movie_app/feature/feature_create/domain/repository/signup_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthentication dataSourceAuth;
  AuthRepositoryImpl({required this.dataSourceAuth});

  @override
  Future<UserCredential> signupWithEmail(String email, String password) async {
    return await dataSourceAuth.signUp(email, password);
  }

  @override
  Future<UserCredential> singinWithEmail(String email, String password) async {
    return await dataSourceAuth.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    await dataSourceAuth.signOut();
  }

  @override
  Future<void> verifyEmail() async {
    await dataSourceAuth.verifyEmail();
  }

  @override
  Future<void> googleSignIn() async {
    await dataSourceAuth.googleSignIn();
  }

  @override
  Future<(String, int?)> phoneNumberSignIn(String number) async {
    return await dataSourceAuth.phoneNumberSignIn(number);
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    await dataSourceAuth.verifyOtp(verificationId, otp);
  }

  @override
  Future<void> resetPassword(String email) async {
    await dataSourceAuth.resetPassword(email);
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
      dataSourceAuth: ref.watch(firebaseAuthenticationProvider));
}
