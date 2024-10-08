// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashScreenRoute,
      $loginScreenRoute,
      $homeScreenRoute,
      $topUpReceiptScreenRoute,
    ];

RouteBase get $splashScreenRoute => GoRouteData.$route(
      path: '/',
      name: 'splash',
      factory: $SplashScreenRouteExtension._fromState,
    );

extension $SplashScreenRouteExtension on SplashScreenRoute {
  static SplashScreenRoute _fromState(GoRouterState state) =>
      SplashScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginScreenRoute => GoRouteData.$route(
      path: '/login',
      name: 'login',
      factory: $LoginScreenRouteExtension._fromState,
    );

extension $LoginScreenRouteExtension on LoginScreenRoute {
  static LoginScreenRoute _fromState(GoRouterState state) => LoginScreenRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeScreenRoute => GoRouteData.$route(
      path: '/home',
      name: 'home',
      factory: $HomeScreenRouteExtension._fromState,
    );

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $topUpReceiptScreenRoute => GoRouteData.$route(
      path: '/receipt/:amount/:beneficiaryName/:mobileNumber',
      name: 'receipt',
      factory: $TopUpReceiptScreenRouteExtension._fromState,
    );

extension $TopUpReceiptScreenRouteExtension on TopUpReceiptScreenRoute {
  static TopUpReceiptScreenRoute _fromState(GoRouterState state) =>
      TopUpReceiptScreenRoute(
        amount: double.parse(state.pathParameters['amount']!),
        beneficiaryName: state.pathParameters['beneficiaryName']!,
        mobileNumber: state.pathParameters['mobileNumber']!,
      );

  String get location => GoRouteData.$location(
        '/receipt/${Uri.encodeComponent(amount!.toString())}/${Uri.encodeComponent(beneficiaryName)}/${Uri.encodeComponent(mobileNumber)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
