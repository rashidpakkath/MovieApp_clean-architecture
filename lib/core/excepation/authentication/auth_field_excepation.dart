import 'package:movie_app/core/excepation/Base_excepation.dart';

final class AuthenticationFailedException extends BaseException {
  AuthenticationFailedException(String reason) : super(reason);
}
