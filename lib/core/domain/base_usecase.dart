import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/core/network/error/errors.dart';

abstract class UseCase<T, Params> {
  Future<Either<E5DError, T>> call(Params params);
}

class NoParams {}