import 'dart:async';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'application/app.dart';
import 'application/initializer.dart';
import 'core/navigation/routes.dart';

void main() async {
  await Initializer.init();
  var initialRoute = await Routes.initialRoute;

  runZonedGuarded<Future<void>>(() async {
    runApp(App(initialRoute));
  },  FirebaseCrashlytics.instance.recordError);
}
