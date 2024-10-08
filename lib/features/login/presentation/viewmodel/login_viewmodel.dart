import 'package:e5d_assesment/core/domain/base_usecase.dart';
import 'package:e5d_assesment/core/network/config/config_notifier.dart';
import 'package:e5d_assesment/core/network/config/configurations_model.dart';
import 'package:e5d_assesment/core/presentation/state/screen_ui_states.dart';
import 'package:e5d_assesment/features/login/data/repository/login_repo_impl.dart';
import 'package:e5d_assesment/features/login/data/repository/login_with_mobile_repo_impl.dart';
import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/model/session_model.dart';
import 'package:e5d_assesment/features/login/domain/model/session_notifier.dart';
import 'package:e5d_assesment/features/login/domain/model/user_model.dart';
import 'package:e5d_assesment/features/login/domain/repository/abstract_login_repo.dart';
import 'package:e5d_assesment/features/login/domain/usecase/login_default_usecase.dart';
import 'package:e5d_assesment/features/login/presentation/errors/login_error.dart';
import 'package:e5d_assesment/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_viewmodel.g.dart';

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

enum LoginUiState {
  idle,
  loading,
  success,
  networkIssue,
  genericError,
  invalidUserNamePassword,
  userNameRequired,
  passwordRequired;
}

class LoginState {
  final ILoginModel? loginModel;
  final LoginUiState? uiState;
  final UserModel? loggedInUser;
  const LoginState({this.loginModel, this.uiState, this.loggedInUser});

  LoginState copyWith(
      ILoginModel? loginModel, LoginUiState? uiState, UserModel? loggedInUser) {
    return LoginState(
      loginModel: loginModel,
      uiState: uiState,
      loggedInUser: loggedInUser,
    );
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

    result?.fold((errorUiState) {
      final loginUiState = errorUiState as LoginUiState;
      state = state.copyWithUiState(loginUiState);
    }, (model) {
      final userModel = model as UserModel;
      loggerNoStack.i("Logged in successfully $userModel");
      // update the local secured database with the token , refresh token

      Configurations? config = ref.read(configProvider);
      if (config != null) {
        // Update token
        // Update refresh token
        ref.read(configProvider.notifier).updateWith(
              config: config.copyWith(
                token: userModel.token,
                refreshToken: userModel.refreshToken,
              ),
            );

        // Update the session
        ref.read(sessionProvider.notifier).updateWith(
              session: SessionModel(
                isLoggedIn: true,
                user: userModel,
              ),
            );

        state = state.copyWithUiState(LoginUiState.success);
      } else {
        state = state.copyWithUiState(LoginUiState.genericError);
      }
    });
  }
}
