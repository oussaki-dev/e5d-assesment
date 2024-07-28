import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/presentation/viewmodel/login_viewmodel.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  LoginViewModel? viewModel;
  LoginState? state;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late Widget buttonText;

  void _onLoginPressed(BuildContext context) {
    viewModel?.login(LoginStrategy.userNamePassword);
  }

  @override
  Widget build(BuildContext context) {
    state = ref.watch(loginViewModelProvider);
    viewModel = ref.read(loginViewModelProvider.notifier);

    if (state?.uiState == LoginUiState.loading) {
      buttonText = const Text('loading');
    } else if (state?.uiState == LoginUiState.success) {
      buttonText = const Text('success');
       } else if (state?.uiState == LoginUiState.error) {
           buttonText = const Text('error');
    } else {
      buttonText = Text(
        AppLocalizations.of(context)!.button_login,
        style: Theme.of(context).textTheme.labelLarge?.merge(const TextStyle(
              color: Colors.white,
              fontSize: 24,
            )),
      );
    }

    return Scaffold(
      body: Container(
        color: E5DColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/ic_logo.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    key: const ObjectKey("text_field_username"),
                    controller: _usernameController,
                    onChanged: (userName) {
                      (state?.loginModel as LoginModel?)?.userName = userName;
                    },
                    style: Theme.of(context).textTheme.labelMedium,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: AppLocalizations.of(context)!.hint_username,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: TextField(
                      key: const ObjectKey("text_field_password"),
                      controller: _passwordController,
                      onChanged: (newPassword) {
                        (state?.loginModel as LoginModel?)?.password =
                            newPassword;
                      },
                      obscureText: true,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        hintText: AppLocalizations.of(context)!.hint_password,
                        suffixIcon: const IconButton(
                          icon: Icon(
                            Icons.visibility_off,
                          ),
                          onPressed: null,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 24),
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => {_onLoginPressed(context)},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: E5DColors.primaryColor40Percent,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 24.0,
                        ),
                      ),
                      child: buttonText,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
