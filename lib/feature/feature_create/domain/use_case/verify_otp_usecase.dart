import 'package:movie_app/core/excepation/authentication/auth_field_excepation.dart';
import 'package:movie_app/core/excepation/authentication/invalid_credentials_exception.dart';
import 'package:movie_app/feature/feature_create/domain/repository/signup_auth_repository.dart';

final class VerifiOtpUsecase {
  final AuthRepository repository;
  VerifiOtpUsecase({required this.repository});
  Future<void> call(String verificationId, String otp) async {
    if (otp.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      await repository.verifyOtp(verificationId, otp);
    } on Exception {
      throw AuthenticationFailedException('Enter your otp correctly,try again');
    }
  }
}
