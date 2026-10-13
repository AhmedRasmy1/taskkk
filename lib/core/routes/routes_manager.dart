import 'package:flutter/material.dart';
import 'package:taskkk/features/auth/presentation/get_started/get_started_screen.dart';
import 'package:taskkk/features/auth/presentation/login/login_screen.dart';
import 'package:taskkk/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:taskkk/features/splash/presentation/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String getStarted = '/get-started';
  static const String signUp = '/sign-up';
  static const String login = '/login';
}

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final Widget screen = switch (settings.name) {
      Routes.getStarted => const GetStartedScreen(),
      Routes.signUp => const SignUpScreen(),
      Routes.login => const LoginScreen(),
      _ => const SplashScreen(),
    };
    return MaterialPageRoute(settings: settings, builder: (_) => screen);
  }
}
