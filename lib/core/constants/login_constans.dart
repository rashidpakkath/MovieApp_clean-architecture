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
  final String googleImage = 'assets/images/login_google.png';
  final String profileImage =
      'assets/images/image-from-rawpixel-id-6012974-png.png';
  final String signUpWith = 'SignIn With Google';
  final String signIn = 'SignUp with';
  final String phoneNumber = 'PHONE NUMBER';
  final String email = 'E-MAIL';
  final String enterPhone = 'Enter Your Phone Number';
  final String sendCode = 'Send-Code';
  final String submit = 'Submit';
  final String enterOtp = 'Enter OTP';
  final String homePage = 'MOVIE STAR';
  final String logOut = 'LogOut';
  final String imagePath = 'https://image.tmdb.org/t/p/w780';
  final String search = 'Search For Movie';
  final String newRelease = 'New Release';
  final String mostWatch = 'Top Rated';
  final String overView = 'OverView';
  final String popular = 'Popular Movies';
  final String playButton = 'WATCH TRAILER';
  final String like = 'LIKE';
  final String Comment = 'COMMENT';
  final String upcoming = 'UpComing';
  final String favourite = 'FAVOURITE';
  final String profile = "PROFILE";
}

@riverpod
LoginConstans loginConstans(LoginConstansRef ref) {
  return LoginConstans();
}
