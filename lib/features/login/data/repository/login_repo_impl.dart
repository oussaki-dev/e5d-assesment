import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/core/network/error/errors.dart';
import 'package:e5d_assesment/features/login/data/data_sources/abstract_login_source.dart';
import 'package:e5d_assesment/features/login/data/data_sources/remote/login_api_impl.dart';
import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/model/user_model.dart';
import 'package:e5d_assesment/features/login/domain/repository/abstract_login_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUserNamePasswordRepositoryProvider =
    Provider<AbstractLoginRepository>((ref) {
  final loginApi = ref.watch(loginApiImplProvider);
  return LoginWithUserNamePasswordRepoImpl(loginApi);
});

class LoginWithUserNamePasswordRepoImpl implements AbstractLoginRepository {
  final AbstractLoginSource _api;

  LoginWithUserNamePasswordRepoImpl(AbstractLoginSource api) : _api = api;

  @override
  Future<Either<E5DError, UserModel>> login(ILoginModel params) async {
    LoginModel model = params as LoginModel;
    try {
      UserModel user = await _api.login(model);
      return Right(user);
    } on E5DError catch (e) {
      return Left(e);
    }
  }
}
