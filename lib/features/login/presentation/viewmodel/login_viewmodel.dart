import 'dart:math';

import 'package:e5d_assesment/core/domain/base_usecase.dart';
import 'package:e5d_assesment/features/login/data/repository/login_repo_impl.dart';
import 'package:e5d_assesment/features/login/data/repository/login_with_mobile_repo_impl.dart';
import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/repository/login_repo.dart';
import 'package:e5d_assesment/features/login/domain/usecase/login_default_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_viewmodel.g.dart';

class LoginState {
  final ILoginModel? loginModel;
  const LoginState({this.loginModel});
  LoginState copyWith(LoginModel loginModel) {
    return LoginState(loginModel: loginModel);
  }
}

enum LoginStrategy {
  userNamePassword,
  usingMobile;

  Provider<AbstractLoginRepository> get repositoryProvider {
    switch (this) {
      case LoginStrategy.userNamePassword:
        return loginUserNamePasswordRepositoryProvider;
      case LoginStrategy.usingMobile:
        return loginWithMobileRepositoryProvider;

      default:
        return loginUserNamePasswordRepositoryProvider;
    }
  }
}

@riverpod
class LoginViewModel extends _$LoginViewModel {

  UseCase? useCase;

  @override
  LoginState build() {
    return LoginState(loginModel: LoginModel(userName: "", password: ""));
  }

  void login(LoginStrategy loginStrategy) async {
    switch (loginStrategy) {
      case LoginStrategy.userNamePassword:
        useCase = LoginUsernamePasswordUseCase(ref.read(
          loginStrategy.repositoryProvider,
        ));
        break;

      case LoginStrategy.usingMobile:
        // Init a different usecase
        break;

      default:
    }

    await useCase?.call(state.loginModel!);
    // do something maybe validate UI ....
  }
}
