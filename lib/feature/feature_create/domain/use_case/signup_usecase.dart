import 'package:movie_app/core/excepation/authentication/auth_field_excepation.dart';
import 'package:movie_app/core/excepation/authentication/invalid_credentials_exception.dart';
import 'package:movie_app/feature/feature_create/domain/repository/signup_auth_repository.dart';

final class SignupUsecase {
  final AuthRepository repository;
  SignupUsecase({required this.repository});

  Future<void> call(String email, String password) async {
    /// Verify email and password
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }

    try {
      await repository.signupWithEmail(email, password);
    } on Exception {
      throw AuthenticationFailedException('Cannot signup. Please try again.');
    }
  }
}
