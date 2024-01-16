import 'package:movie_app/core/excepation/Base_excepation.dart';

final class InvalidCredentialsException extends BaseException {
  InvalidCredentialsException() : super('Invalid user input');
}
