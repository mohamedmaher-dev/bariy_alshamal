import 'package:flutter/foundation.dart';

abstract class DebugPrint {
  static void _print(String printCode) {
    if (kDebugMode) {
      print(printCode);
    }
  }

  static void normal(String msg) {
    _print('\u001b[0m$msg');
  }

  static void success(String msg) {
    _print('\u001b[32m$msg');
  }

  static void successBack(String msg) {
    _print('\u001b[30;42m$msg\u001b[0m');
  }

  static void error(String msg) {
    _print('\u001b[31m$msg');
  }

  static void errorBack(String msg) {
    _print('\u001b[30;41m$msg\u001b[0m');
  }

  static void warning(String msg) {
    _print('\u001b[33m$msg');
  }

  static void warningBack(String msg) {
    _print('\u001b[30;43m$msg\u001b[0m');
  }

  static void black(String msg) {
    _print('\u001b[30m$msg');
  }

  static void blue(String msg) {
    _print('\u001b[34m$msg');
  }

  static void white(String msg) {
    _print('\u001b[37m$msg');
  }

  static void magenta(String msg) {
    _print('\u001b[35m$msg');
  }

  static void cyan(String msg) {
    _print('\u001b[36m$msg');
  }

  static void custom(
    String msg, {
    TextWeight? textWeight,
    bool? isItalic,
    bool? isUnderline,
    bool? isDone,
    TextAlpha? textAlpha,
    ColorList? textColor,
    ColorList? backColor,
  }) {
    late String weight;
    late String italic;
    late String underline;
    late String done;
    late String alpha;
    late String colorText;
    late String colorBack;

    if (textWeight == null) {
      weight = "";
    } else {
      switch (textWeight) {
        case TextWeight.normal:
          {
            weight = "0;";
          }
        case TextWeight.bold:
          {
            weight = "1;";
          }
      }
    }

    if (isItalic == null || !isItalic) {
      italic = "";
    } else {
      italic = "3;";
    }

    if (isUnderline == null || !isUnderline) {
      underline = "";
    } else {
      underline = "4;";
    }

    if (isDone == null || !isDone) {
      done = "";
    } else {
      done = "9;";
    }

    if (textAlpha == null) {
      alpha = "";
    } else {
      alpha = "${_getAlphaCode(textAlpha)};";
    }

    if (textColor == null) {
      colorText = "";
    } else {
      colorText = "3${_getColorCode(textColor)};";
    }

    if (backColor == null) {
      colorBack = "";
    } else {
      colorBack = "4${_getColorCode(backColor)};";
    }

    _print(
        '\u001b[$weight$italic$underline$done$alpha$colorText${colorBack}m$msg\u001b[0m');
  }

  static String _getColorCode(ColorList color) {
    switch (color) {
      case ColorList.black:
        {
          return "0";
        }
      case ColorList.red:
        {
          return "1";
        }
      case ColorList.green:
        {
          return "2";
        }

      case ColorList.yellow:
        {
          return "3";
        }
      case ColorList.blue:
        {
          return "4";
        }
      case ColorList.magenta:
        {
          return "5";
        }
      case ColorList.cyan:
        {
          return "6";
        }
      case ColorList.white:
        {
          return "7";
        }
    }
  }

  static String _getAlphaCode(TextAlpha alpha) {
    switch (alpha) {
      case TextAlpha.semi:
        {
          return "2";
        }
      case TextAlpha.full:
        {
          return "8";
        }
      case TextAlpha.slow:
        {
          return "5";
        }
      case TextAlpha.fast:
        {
          return "6";
        }
    }
  }
}

enum TextWeight {
  bold,
  normal,
}

enum TextAlpha {
  semi,
  full,
  slow,
  fast,
}

enum ColorList {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
}
