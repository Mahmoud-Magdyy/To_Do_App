import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

import '../features/task/presentation/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: AppStrings.appName,
      theme: getAppTheme(),
      debugShowCheckedModeBanner: false,
      
      home: const SplashScreen()
    );
  }
}