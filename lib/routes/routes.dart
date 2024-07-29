import 'package:e5d_assesment/features/login/presentation/view/login_screen.dart';
import 'package:e5d_assesment/features/splash/presentation/splash_screen.dart';
import 'package:e5d_assesment/features/home/presentation/view/home_screen.dart';
import 'package:e5d_assesment/features/topup/presentation/view/topup_receipt_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashScreenRoute>(path: '/', name: 'splash')
@immutable
class SplashScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

@TypedGoRoute<LoginScreenRoute>(path: '/login', name: 'login')
@immutable
class LoginScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedGoRoute<HomeScreenRoute>(path: '/home', name: 'home')
@immutable
class HomeScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen();
  }
}

@TypedGoRoute<TopUpScreenRoute>(path: '/receipt', name: 'receipt')
@immutable
class TopUpScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TopUpReceiptScreen();
  }
}
