import 'package:e5d_assesment/core/network/error/errors.dart';

class NetworkException implements E5DError {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

class BadRequestException extends NetworkException {
  BadRequestException(super.message);
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException(super.message);
}

class NotFoundException extends NetworkException {
  NotFoundException(super.message);
}

class ServerErrorException extends NetworkException {
  ServerErrorException(super.message);
}

class TimeoutException extends NetworkException {
  TimeoutException(super.message);
}

class NoInternetException extends NetworkException {
  NoInternetException(super.message);
}
