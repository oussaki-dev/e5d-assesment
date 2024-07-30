import 'package:e5d_assesment/core/network/config/config_notifier.dart';
import 'package:e5d_assesment/core/network/config/configurations_model.dart';
import 'package:e5d_assesment/main.dart';
import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // read from localstorage if user is loggedin

        ProviderScope.containerOf(context)
            .read(configProvider.notifier)
            .updateWith(
              config: const Configurations(
                // let's assume we're getting the configuration from an API...
                baseUrl:
                    'https://43f7-2001-8f8-1923-956-3538-ee99-1e2f-6cb6.ngrok-free.app',
                transactionFee: 1.0,
                verifiedTopUpThreshold: 1000,
                nonVerifiedTopUpThreshold: 500,
                monthlyMaxTopUpThreshold: 3000,
              ),
            );

        LoginScreenRoute().go(context);
      },
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: E5DColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/ic_logo.svg'),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
              child: Text(
                AppLocalizations.of(context)!.slogan,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.merge(const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    )),
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
      ),
    );
  }
}
