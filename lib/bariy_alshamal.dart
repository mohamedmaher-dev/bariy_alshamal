import 'package:bariy_alshamal/core/localization/generated/l10n.dart';
import 'package:bariy_alshamal/core/themes/app_theme.dart';
import 'package:bariy_alshamal/features/splash/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BariyAlshamal extends StatelessWidget {
  const BariyAlshamal({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          Language.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Language.delegate.supportedLocales,
        home: const SplashView(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
