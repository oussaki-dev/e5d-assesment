import 'package:e5d_assesment/app.dart';
import 'package:e5d_assesment/features/login/presentation/view/login_screen.dart';
import 'package:e5d_assesment/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void main() {
  runApp(ProviderScope(child: E5DApp()));
}
