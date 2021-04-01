import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/core/consts.dart';
import 'package:intera/core/helpers/theme_helper.dart';
import 'package:intera/core/settings.dart';

class AppTheme {
  /// Pallete of `Primary` color's
  static Color primary = Color(0xFF6D5FFD);
  static Color primaryDark = Color(0xFF5E68E1);
  static Color primaryLight = Color(0xFF878EE9);

  /// Pallete of `Secondary` color's
  static Color secondary = Color(0xFF3FD4B4);
  static Color secondaryDark = Color(0xFF3FD4B4);
  static Color secondaryLight = Color(0xFF3FD4B4);

  /// Pallete of `State` color's
  static Color error = Color(0xFFFF3B3B);
  static Color success = Color(0xFF06C270);
  static Color warning = Color(0XFFFFCC00);
  static Color info = Color(0xFF0063F7);

  /// Other color's
  static Color background = Color(0xFFFAFAFC);
  static Color backgroundDark = Color(0xFF1D1B1C);

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
    accentColor: secondary,
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
        decoration: TextDecoration.none,
      ),
      headline2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        decoration: TextDecoration.none,
      ),
      headline3: TextStyle(
        fontFamily: 'Circular',
        fontSize: 48,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        decoration: TextDecoration.none,
      ),
      headline4: TextStyle(
        fontFamily: 'Circular',
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        decoration: TextDecoration.none,
      ),
      headline5: TextStyle(
        fontFamily: 'Circular',
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        decoration: TextDecoration.none,
      ),
      headline6: TextStyle(
        fontFamily: 'Circular',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        decoration: TextDecoration.none,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Circular',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        decoration: TextDecoration.none,
      ),
      subtitle2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        decoration: TextDecoration.none,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Circular',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        decoration: TextDecoration.none,
      ),
      bodyText2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        decoration: TextDecoration.none,
      ),
      button: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        decoration: TextDecoration.none,
      ),
      caption: TextStyle(
        fontFamily: 'Circular',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        decoration: TextDecoration.none,
      ),
      overline: TextStyle(
        fontFamily: 'Circular',
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        decoration: TextDecoration.none,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: background,
      elevation: 0,
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
    accentColor: secondary,
    splashColor: primary,
    scaffoldBackgroundColor: backgroundDark,
    cardColor: Colors.grey.shade900,
    cardTheme: CardTheme(
      color: Colors.grey.shade900,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: backgroundDark,
      elevation: 0,
    ),
    iconTheme: IconThemeData(),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: 'Circular',
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: Colors.white12,
        decoration: TextDecoration.none,
      ),
      headline2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: Colors.white24,
        decoration: TextDecoration.none,
      ),
      headline3: TextStyle(
        fontFamily: 'Circular',
        fontSize: 48,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: Colors.white30,
        decoration: TextDecoration.none,
      ),
      headline4: TextStyle(
        fontFamily: 'Circular',
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.white24,
        decoration: TextDecoration.none,
      ),
      headline5: TextStyle(
        fontFamily: 'Circular',
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: Colors.white70,
        decoration: TextDecoration.none,
      ),
      headline6: TextStyle(
        fontFamily: 'Circular',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Circular',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      subtitle2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Circular',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      bodyText2: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      button: TextStyle(
        fontFamily: 'Circular',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      caption: TextStyle(
        fontFamily: 'Circular',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: Colors.white30,
        decoration: TextDecoration.none,
      ),
      overline: TextStyle(
        fontFamily: 'Circular',
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: Colors.white24,
        decoration: TextDecoration.none,
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
      Settings.theme.value = theme;
      theme == ThemeMode.light
          ? AppTheme.changeStatusBar<Dark>()
          : AppTheme.changeStatusBar<Light>();
    } else {
      if (Get.isDarkMode) {
        Get.changeThemeMode(ThemeMode.light);
        Settings.theme.value = ThemeMode.light;
        AppTheme.changeStatusBar<Dark>();
      } else {
        Get.changeThemeMode(ThemeMode.dark);
        Settings.theme.value = ThemeMode.dark;
        AppTheme.changeStatusBar<Light>();
      }
    }

    await storage.add(PATH.THEME, Settings.theme.value!.index.toString());
  }
}
