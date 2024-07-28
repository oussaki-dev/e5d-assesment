import 'package:e5d_assesment/features/login/domain/usecase/login_default_usecase.dart';
import 'package:equatable/equatable.dart';

abstract class E5DError {}

/// General failures
class ServerFailure extends E5DError {
  final int? statusCode;
  ServerFailure(this.statusCode);
}

/// Cancel token failure
class CancelTokenFailure extends E5DError {
  final int? statusCode;
  CancelTokenFailure(this.statusCode);
}
