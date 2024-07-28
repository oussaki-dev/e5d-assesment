import 'package:e5d_assesment/core/domain/base_usecase.dart';
import 'package:e5d_assesment/core/network/error/errors.dart';
import 'package:e5d_assesment/features/login/data/repository/login_repo_impl.dart';
import 'package:e5d_assesment/features/login/data/repository/login_with_mobile_repo_impl.dart';
import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/repository/login_repo.dart';
import 'package:e5d_assesment/features/login/domain/usecase/login_default_usecase.dart';
import 'package:e5d_assesment/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_viewmodel.g.dart';

enum LoginUiState {
  idle,
  loading,
  success,
  error;

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
    }
  }
}

class LoginState {
  final ILoginModel? loginModel;
  final LoginUiState? uiState;
  const LoginState({this.loginModel, this.uiState});
  LoginState copyWith(ILoginModel? loginModel, LoginUiState? uiState) {
    return LoginState(loginModel: loginModel, uiState: uiState);
  }

  LoginState copyWithUiState(LoginUiState? uiState) {
    return LoginState(loginModel: loginModel, uiState: uiState);
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
    state = state.copyWithUiState(LoginUiState.loading);
    switch (loginStrategy) {
      case LoginStrategy.userNamePassword:
        useCase = LoginUsernamePasswordUseCase(ref.watch(
          loginStrategy.repositoryProvider,
        ));
        break;
      case LoginStrategy.usingMobile:
        // Init a different usecase for mobile
        break;
    }

    var result = await useCase?.call(state.loginModel!);
     
    if (result?.isRight() == true) {
      loggerNoStack.i("Logged in successfully");
      state = state.copyWithUiState(LoginUiState.success);
    } else {
      state = state.copyWithUiState(LoginUiState.error);
    }
  }
}
