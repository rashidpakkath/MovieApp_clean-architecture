import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_constans.g.dart';

final class LoginConstans {
  final String welcomeText = 'WELCOME BACK!';
  final String helloText = 'HELLO!';
  final String login = 'LOGIN';
  final String singin = 'SIGNUP';
  final String enterEmail = 'Enter your e-mail';
  final String password = 'Password';
  final String forgetPassword = 'Forget Password';
  final String confirmPassword = 'Confirm Password';
  final String createAccount = 'Create New Account';
  final String loginAccount = 'Login Your Account';
}

@riverpod
LoginConstans loginConstans(LoginConstansRef ref) {
  return LoginConstans();
}
