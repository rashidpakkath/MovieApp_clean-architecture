import 'package:movie_app/core/excepation/authentication/auth_field_excepation.dart';
import 'package:movie_app/core/excepation/authentication/invalid_credentials_exception.dart';
import 'package:movie_app/feature/feature_create/domain/repository/signup_auth_repository.dart';

final class PhoneNumberUsecase {
  final AuthRepository repository;
  PhoneNumberUsecase({required this.repository});
  Future<(String, int?)> call(String phone) async {
    if (phone.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      return await repository.phoneNumberSignIn(phone);
    } on Exception {
      throw AuthenticationFailedException('Enter your phone number correctly');
    }
  }
}
