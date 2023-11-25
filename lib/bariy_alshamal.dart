import 'package:bariy_alshamal/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'features/splash/views/splash_view.dart';

class BariyAlshamal extends StatelessWidget {
  const BariyAlshamal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
