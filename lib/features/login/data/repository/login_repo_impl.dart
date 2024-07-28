import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/core/network/error/errors.dart';
import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/model/user_model.dart';
import 'package:e5d_assesment/features/login/domain/repository/login_repo.dart';
import 'package:e5d_assesment/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUserNamePasswordRepositoryProvider =
    Provider<AbstractLoginRepository>((ref) => LoginWithUserNamePasswordRepoImpl(ref));

class LoginWithUserNamePasswordRepoImpl implements AbstractLoginRepository {
  LoginWithUserNamePasswordRepoImpl(this.ref);
  final Ref ref;

  @override
  Future<Either<E5DError, UserModel>> login(ILoginModel params) {
    LoginModel model = params as LoginModel;
    loggerNoStack.d(model);
    // TODO: implement login
    throw UnimplementedError();
  }
}
