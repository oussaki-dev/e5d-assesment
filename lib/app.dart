import 'package:e5d_assesment/main.dart';
import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class E5DApp extends MaterialApp {
  E5DApp({super.key})
      : super.router(
          routerConfig: GoRouter(
            initialLocation: '/',
            // errorBuilder: (context, state) => ErrorScreen(state.error),
            routes: [
              ...$appRoutes
            ],
          ),
          theme: AppThemes.main.theme,
          debugShowCheckedModeBanner: false,
        );
}
