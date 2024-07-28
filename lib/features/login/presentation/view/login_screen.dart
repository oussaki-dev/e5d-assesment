import 'package:e5d_assesment/main.dart';
import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onLoginPressed(BuildContext context) {
    loggerNoStack.d("open home");
    HomeScreenRoute().go(context);
  }

  @override
  Widget build(BuildContext context) {
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
                      child: Text(
                        AppLocalizations.of(context)!.button_login,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.merge(const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            )),
                      ),
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
}
