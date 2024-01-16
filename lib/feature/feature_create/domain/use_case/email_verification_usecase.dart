import 'package:movie_app/core/excepation/authentication/auth_field_excepation.dart';
import 'package:movie_app/feature/feature_create/domain/repository/signup_auth_repository.dart';

final class emailVerificationUseCase {
  final AuthRepository repository;
  emailVerificationUseCase({required this.repository});
  Future<void> call() async {
    try {
      await repository.verifyEmail();
    } on Exception {
      throw AuthenticationFailedException(
        "Email Verification failed please retry",
      );
    }
  }
}
