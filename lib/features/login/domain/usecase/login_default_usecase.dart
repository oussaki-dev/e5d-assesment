import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/core/domain/base_usecase.dart';
import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/model/user_model.dart';
import 'package:e5d_assesment/features/login/domain/repository/abstract_login_repo.dart';
import 'package:e5d_assesment/features/login/presentation/viewmodel/login_viewmodel.dart';

class LoginUsernamePasswordUseCase
    extends UseCase<UserModel, LoginModel, LoginUiState> {
  final AbstractLoginRepository repository;

  static const String errorCodeInvalidCredentials = 'invalid_creds';
  // injecting the repo for better testing
  LoginUsernamePasswordUseCase(this.repository);

  @override
  Future<Either<LoginUiState, UserModel>> call(ILoginModel params) async {
    LoginModel model = params as LoginModel;

    if (model.userName.trim().isEmpty) {
      return const Left(LoginUiState.userNameRequired);
    }

    if (model.password.trim().isEmpty) {
      return const Left(LoginUiState.passwordRequired);
    }

    final result = await repository.login(params);

    return result.fold((l) {
      return Left(l);
    }, (data) async {
      if (data.errorCode != null) {
        if (data.errorCode == errorCodeInvalidCredentials) {
          return const Left(LoginUiState.invalidUserNamePassword);
        }
      }
      return Right(data);
    });
  }
}
