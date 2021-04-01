import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:intera/core/settings.dart';
import '../core/theme/theme.dart';
import '../application/navigation/navigation.dart';

class App extends StatelessWidget {
  final String initialRoute;
  App(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 820),
      allowFontScaling: true,
      builder: () {
        return GetMaterialApp(
          title: 'Intera',
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute,
          getPages: Navigation.routes,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: Settings.theme.value!,
          builder: (context, child) => GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            behavior: HitTestBehavior.opaque,
            child: child,
          ),
        );
      },
    );
  }
}
