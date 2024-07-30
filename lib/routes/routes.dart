import 'package:e5d_assesment/features/login/presentation/view/login_screen.dart';
import 'package:e5d_assesment/features/splash/presentation/splash_screen.dart';
import 'package:e5d_assesment/features/home/presentation/view/home_screen.dart';
import 'package:e5d_assesment/features/topup/domain/model/top_up_transaction.dart';
import 'package:e5d_assesment/features/topup/presentation/view/topup_receipt_screen.dart';
import 'package:e5d_assesment/features/transactions/domain/model/transaction_model.dart';
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

@TypedGoRoute<TopUpReceiptScreenRoute>(
    path: '/receipt/:amount/:beneficiaryName/:mobileNumber', name: 'receipt')
@immutable
class TopUpReceiptScreenRoute extends GoRouteData {
  final double? amount;
  final String beneficiaryName;
  final String mobileNumber;
  const TopUpReceiptScreenRoute(
      {this.amount, required this.beneficiaryName, required this.mobileNumber});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TopUpReceiptScreen(
      amount: amount,
      beneficiaryName: beneficiaryName,
      mobileNumber: mobileNumber,
    );
  }
}
