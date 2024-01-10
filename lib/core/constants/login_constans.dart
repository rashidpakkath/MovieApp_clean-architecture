import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_constans.g.dart';

final class LoginConstans {
  final String welcomeText = 'WELCOME BACK';
  final String helloText = 'HELLOW';
  final String login = 'LOGIN';
  final String singin = 'SINGUP';
  final String enterEmail = 'Enter Your E-mail';
  final String password = 'Password';
  final String forgetPassword = 'Forget Password';
}

@riverpod
LoginConstans loginConstans(LoginConstansRef ref) {
  return LoginConstans();
}
