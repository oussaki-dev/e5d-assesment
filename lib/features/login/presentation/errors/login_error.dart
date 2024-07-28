import 'package:e5d_assesment/core/network/error/errors.dart';

enum EInputError {
  invalidUserNamePassword,
  userNameTooShort,
  userNameRequired,
  passwordRequired
}



class LoginInputError extends E5DError {
  final EInputError? inputError;
   LoginInputError(this.inputError);
}
