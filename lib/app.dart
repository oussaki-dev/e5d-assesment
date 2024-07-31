import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final scafoldKey = GlobalKey<ScaffoldMessengerState>();

class E5DApp extends ConsumerStatefulWidget {
  const E5DApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _E5DAppState();
}

class _E5DAppState extends ConsumerState<E5DApp> {
  @override
  Widget build(BuildContext context) {
    // final config = ref.watch(configProvider);

    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/',
        // errorBuilder: (context, state) => ErrorScreen(state.error),
        routes: [...$appRoutes],
      ),
      theme: AppThemes.main.theme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      scaffoldMessengerKey: scafoldKey,
      // showPerformanceOverlay: true
    );
  }
}
