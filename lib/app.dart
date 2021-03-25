import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:intera/shared/settings.dart';
import 'shared/theme/theme.dart';
import 'shared/navigation/navigation.dart';

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
          themeMode: Settings.theme,
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
