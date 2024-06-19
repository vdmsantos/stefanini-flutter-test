import 'package:flutter/material.dart';
import 'package:stefanini_flutter_test/app/modules/login/presentation/views/login_page.dart';
import 'package:stefanini_flutter_test/app/modules/login/presentation/views/splash_page.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.route: (context) => const SplashPage(),
  LoginPage.route: (context) => const LoginPage(),
};
