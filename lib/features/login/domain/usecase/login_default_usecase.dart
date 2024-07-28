import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/core/domain/base_usecase.dart';
import 'package:e5d_assesment/core/network/error/errors.dart';
import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/model/user_model.dart';
import 'package:e5d_assesment/features/login/domain/repository/login_repo.dart';
import 'package:e5d_assesment/features/login/presentation/errors/login_error.dart';


class LoginUsernamePasswordUseCase extends UseCase<UserModel, LoginModel> {
  final AbstractLoginRepository repository;

  final minUsernameLength = 4;

  // injecting the repo for better testing
  LoginUsernamePasswordUseCase(this.repository);

  @override
  Future<Either<E5DError, UserModel>> call(ILoginModel params) async {
    LoginModel model = params as LoginModel;
    if (model.userName.isEmpty || model.password.isEmpty) {
      return Left(LoginInputError(
        EInputError.invalidUserNamePassword,
      ));
    }

    // check if username is long enough
    if (model.userName.length < minUsernameLength) {
      return Left(LoginInputError(
        EInputError.userNameRequired,
      ));
    }

    final result = await repository.login(params);

    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
