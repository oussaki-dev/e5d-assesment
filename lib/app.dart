import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class E5DApp extends MaterialApp {
  E5DApp({super.key})
      : super.router(
          routerConfig: GoRouter(
            initialLocation: '/',
            // errorBuilder: (context, state) => ErrorScreen(state.error),
            routes: [...$appRoutes],
          ),
          theme: AppThemes.main.theme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('ar'),
          showPerformanceOverlay: true
        );
}
