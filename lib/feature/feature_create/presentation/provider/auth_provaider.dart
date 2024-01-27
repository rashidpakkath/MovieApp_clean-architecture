import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/excepation/Base_excepation.dart';
import 'package:movie_app/core/utils/snacbar_utils.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/pageview_widget.dart';
import 'package:movie_app/feature/feature_create/data/repository/signup_auth_repository_impl.dart';
import 'package:movie_app/feature/feature_create/domain/entities/auth_state_entity.dart';
import 'package:movie_app/feature/feature_create/domain/repository/signup_auth_repository.dart';
import 'package:movie_app/feature/feature_create/domain/use_case/email_verification_usecase.dart';
import 'package:movie_app/feature/feature_create/domain/use_case/google_signup_usecase.dart';
import 'package:movie_app/feature/feature_create/domain/use_case/login_usecase.dart';
import 'package:movie_app/feature/feature_create/domain/use_case/logout_usecase.dart';
import 'package:movie_app/feature/feature_create/domain/use_case/phone_signup_usecase.dart';
import 'package:movie_app/feature/feature_create/domain/use_case/reset_password_usecase.dart';
import 'package:movie_app/feature/feature_create/domain/use_case/signup_usecase.dart';
import 'package:movie_app/feature/feature_create/domain/use_case/verify_otp_usecase.dart';
import 'package:movie_app/feature/featue_api/presentation/pages/homepage.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/login_page.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/pin_snakbar_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provaider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pinNumberController = TextEditingController();
  late final AuthRepository repository;
  @override
  AuthState build(BuildContext context) {
    repository = ref.read(authRepositoryProvider);
    return AuthState(verificationId: '', resendToken: null);
  }

  Future<void> emailVerification() async {
    try {
      await EmailVerificationUseCase(repository: repository)();
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      await SignupUsecase(repository: repository)(email, password);
      await emailVerification();
      Future.sync(() => context.go(MyLoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithPhone(String phone) async {
    try {
      final verificationData =
          await PhoneNumberUsecase(repository: repository)(phone);
      state = AuthState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
      Future.sync(() => context.push(SnakbarWidget.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(String otp) async {
    try {
      await VerifiOtpUsecase(repository: repository)(state.verificationId, otp);
      Future.sync(() => context.go(PageViewWidget.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await LoginUsecase(repository: repository)(email, password);
      Future.sync(() => context.go(PageViewWidget.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> googleSignin() async {
    try {
      await GoogleSignInUseCase(repository: repository)();
      Future.sync(() => context.go(PageViewWidget.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> logout() async {
    try {
      await LogoutUsecase(repository: repository)();
      Future.sync(() => context.go(MyLoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> reasetPasword(String email) async {
    try {
      await ResetPasswordUseCase(repository: repository)(email);
      Future.sync(() => context.go(MyLoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }
}
