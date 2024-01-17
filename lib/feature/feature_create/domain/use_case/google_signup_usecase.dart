import 'package:movie_app/core/excepation/authentication/auth_field_excepation.dart';
import 'package:movie_app/feature/feature_create/domain/repository/signup_auth_repository.dart';

final class GoogleSignInUseCase {
  final AuthRepository repository;
  GoogleSignInUseCase({required this.repository});
  Future<void> call() async {
    try {
      await repository.googleSignIn();
    } on Exception {
      throw AuthenticationFailedException(
        "Google SignIn failed please retry",
      );
    }
  }
}
