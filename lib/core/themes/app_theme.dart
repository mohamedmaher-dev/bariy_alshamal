import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: ColorsManger.green,
    textTheme: GoogleFonts.almaraiTextTheme(),
  );
}
