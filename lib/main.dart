import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskkk/core/di/di.dart';
import 'package:taskkk/firebase_options.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/utils/cashed_data_shared_preferences.dart';
import 'package:taskkk/core/utils/my_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheService.cacheInitialization();
  configureDependencies();
  runApp(const MyApp());
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
      home: const Scaffold(
        body: SizedBox.shrink(),
      ),
    );
  }
}
