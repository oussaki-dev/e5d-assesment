import 'package:e5d_assesment/main.dart';
import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    loggerNoStack.d("Splash screen");
    
    Future.delayed(
      const Duration(seconds: 3),
      () => {LoginScreenRoute().go(context)},
    );

    return Scaffold(
      body: Container(
        color: E5DColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/ic_logo.svg'),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
              child: Text(
                "The everyday platform for people at work",
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
