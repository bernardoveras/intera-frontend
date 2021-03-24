import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  /// Pallete of `Primary` color's
  static Color primary = Color(0xFF665CC8);
  static Color primaryDark = Color(0xFF4F45AA);
  static Color primaryLight = Color(0xFF7079D1);

  /// Pallete of `Secondary` color's
  static Color secondary = Color(0xFF33D3AB);
  static Color secondaryDark = Color(0xFF21B691);
  static Color secondaryLight = Color(0xFF66E395);

  /// Pallete of `State` color's
  static Color error = Color(0xFFFF3B3B);
  static Color success = Color(0xFF06C270);
  static Color warning = Color(0XFFFFCC00);
  static Color info = Color(0xFF0063F7);

  /// Other color's
  static Color background = Color(0xFFFAFAFC);
  static Color backgroundDark = Color(0xFF121214);

  /// Init `theme data` from application
  static ThemeData light(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primary,
      primaryColorDark: primaryDark,
      primaryColorLight: primaryLight,
      scaffoldBackgroundColor: background,
      dialogBackgroundColor: background,
      backgroundColor: background,
      accentColor: secondary,
      appBarTheme: _appBarTheme(context),
      textTheme: _textTheme(context),
    );
  }

  /// Init `theme dark data` from application
  static ThemeData dark(BuildContext context) {
    return Theme.of(context).copyWith(
      brightness: Brightness.dark,
      primaryColor: primary,
      primaryColorDark: primaryDark,
      primaryColorLight: primaryLight,
      scaffoldBackgroundColor: backgroundDark,
      dialogBackgroundColor: backgroundDark,
      backgroundColor: backgroundDark,
      appBarTheme: _appBarTheme(context),
      textTheme: _textTheme(context),
    );
  }


  static AppBarTheme? _appBarTheme(BuildContext context) {
    return AppBarTheme(
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Inter',
            bodyColor: Colors.white,
            displayColor: Colors.white,
            decoration: TextDecoration.none,
          ),
      brightness: Brightness.dark,
      color: primary,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    );
  }

  static TextTheme _textTheme(BuildContext context) {
    return Theme.of(context).textTheme.apply(
          fontFamily: 'Inter',
          decoration: TextDecoration.none,
        );
  }
}
