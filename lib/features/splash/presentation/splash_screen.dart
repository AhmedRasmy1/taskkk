import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/core/resources/assets_manager.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/routes/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // TODO(firebase): choose the next route based on the auth state.
    _timer = Timer(AppConstants.splashDuration, _navigateNext);
  }

  void _navigateNext() {
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(Routes.getStarted);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: ColorManager.splashBackground,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: ColorManager.splashBackground,
        body: Center(
          child: Image.asset(
            AssetsManager.logo,
            width: AppConstants.splashLogoWidth,
            height: AppConstants.splashLogoHeight,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
