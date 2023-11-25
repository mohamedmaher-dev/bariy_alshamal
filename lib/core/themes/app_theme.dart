import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManger.green,
  );
}
