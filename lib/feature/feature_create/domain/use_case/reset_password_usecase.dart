import 'package:movie_app/core/excepation/authentication/auth_field_excepation.dart';
import 'package:movie_app/feature/feature_create/domain/repository/signup_auth_repository.dart';

final class ResetPasswordUseCase {
  final AuthRepository repository;
  ResetPasswordUseCase({required this.repository});
  Future<void> call(String email) async {
    try {
      await repository.resetPassword(email);
    } on Exception {
      throw AuthenticationFailedException(
        "Failed please retry",
      );
    }
  }
}
