import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/shared/helpers/theme_helper.dart';
import 'package:intera/shared/settings.dart';

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
  static Color backgroundDark = Color(0xFF17191F);

  /// Init `theme light data` from application
  static final ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(),
      brightness: Brightness.light,
      iconTheme: IconThemeData(),
      textTheme: TextTheme(),
    ),
    primaryColor: primary,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    accentColorBrightness: Brightness.light,
    backgroundColor: background,
    buttonColor: primary,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 0,
      focusElevation: 1,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      foregroundColor: Colors.white,
    ),
    accentColor: primary,
    splashColor: primary,
    scaffoldBackgroundColor: background,
    cardColor: Colors.white,
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: 'Circular',
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        fontFamily: 'Circular',
        fontSize: 48,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      headline4: TextStyle(
        fontFamily: 'Circular',
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        fontFamily: 'Circular',
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      headline6: TextStyle(
        fontFamily: 'Circular',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      subtitle1: TextStyle(
          fontFamily: 'Circular',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15),
      subtitle2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyText1: TextStyle(
          fontFamily: 'Circular',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5),
      bodyText2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      button: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      caption: TextStyle(
        fontFamily: 'Circular',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      overline: TextStyle(
        fontFamily: 'Circular',
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    ),
    buttonTheme: ButtonThemeData(),
  );

  /// Init `theme dark data` from application
  static final ThemeData dark = ThemeData(
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(),
      brightness: Brightness.dark,
      color: primary,
      iconTheme: IconThemeData(),
      textTheme: TextTheme(),
    ),
    primaryColor: primary,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    accentColorBrightness: Brightness.dark,
    backgroundColor: backgroundDark,
    buttonColor: primary,
    dividerColor: Colors.white30,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 0,
      focusElevation: 1,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      foregroundColor: Colors.white,
    ),
    accentColor: primary,
    splashColor: primary,
    scaffoldBackgroundColor: backgroundDark,
    cardColor: Colors.grey.shade900,
    cardTheme: CardTheme(
      color: Colors.grey.shade900,
    ),
    iconTheme: IconThemeData(),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: 'Circular',
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: Colors.white12,
      ),
      headline2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: Colors.white24,
      ),
      headline3: TextStyle(
        fontFamily: 'Circular',
        fontSize: 48,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: Colors.white30,
      ),
      headline4: TextStyle(
        fontFamily: 'Circular',
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.white24,
      ),
      headline5: TextStyle(
        fontFamily: 'Circular',
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: Colors.white70,
      ),
      headline6: TextStyle(
        fontFamily: 'Circular',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Circular',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Circular',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.white,
      ),
      button: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: Colors.white,
      ),
      caption: TextStyle(
        fontFamily: 'Circular',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: Colors.white30,
      ),
      overline: TextStyle(
        fontFamily: 'Circular',
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: Colors.white24,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primary,
    ),
  );

  static void changeStatusBar<T extends ThemeHelper>(
      [SystemUiOverlayStyle? style]) {
    if (T == Light) {
      return SystemChrome.setSystemUIOverlayStyle(
        style != null
            ? style.copyWith(
                systemNavigationBarIconBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.dark,
              )
            : SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.transparent,
              ),
      );
    } else if (T == Dark) {
      return SystemChrome.setSystemUIOverlayStyle(
        style != null
            ? style.copyWith(
                systemNavigationBarIconBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
              )
            : SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              ),
      );
    }

    return SystemChrome.setSystemUIOverlayStyle(
      style ??
          SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
          ),
    );
  }

  static Future<void> changeTheme([ThemeMode? theme]) async {
    ILocalStorage storage = Get.find();

    if (theme != null) {
      Get.changeThemeMode(theme);
      Settings.theme = theme;
      theme == ThemeMode.light
          ? AppTheme.changeStatusBar<Dark>()
          : AppTheme.changeStatusBar<Light>();
    } else {
      if (Get.isDarkMode) {
        Get.changeThemeMode(ThemeMode.light);
        Settings.theme = ThemeMode.light;
        AppTheme.changeStatusBar<Dark>();
      } else {
        Get.changeThemeMode(ThemeMode.dark);
        Settings.theme = ThemeMode.dark;
        AppTheme.changeStatusBar<Light>();
      }
    }

    await storage.add('theme', Settings.theme.index.toString());
  }
}

