import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:taskkk/core/di/di.dart';
import 'package:taskkk/firebase_options.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/utils/cashed_data_shared_preferences.dart';
import 'package:taskkk/core/utils/my_bloc_observer.dart';
import 'package:taskkk/features/splash/presentation/splash_screen.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Keep the native splash on screen until initialization is finished.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  try {
    Bloc.observer = MyBlocObserver();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await CacheService.cacheInitialization();
    configureDependencies();
  } finally {
    // Always hand over to Flutter's SplashScreen (visually identical), even
    // if initialization throws, so the app never hangs on the native splash.
    runApp(const MyApp());
    widgetsBinding.addPostFrameCallback((_) => FlutterNativeSplash.remove());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'taskkk',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.background,
        colorScheme: const ColorScheme.light(
          primary: ColorManager.primary,
          onPrimary: ColorManager.white,
          error: ColorManager.error,
          surface: ColorManager.background,
          onSurface: ColorManager.black,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
