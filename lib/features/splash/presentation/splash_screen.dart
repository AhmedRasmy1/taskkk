import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskkk/core/resources/assets_manager.dart';
import 'package:taskkk/core/resources/color_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
            width: 59,
            height: 36,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
