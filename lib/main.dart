import 'dart:async';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'app.dart';
import 'initializer.dart';
import 'shared/navigation/routes.dart';

void main() async {
  await Initializer.init();
  var initialRoute = await Routes.initialRoute;

  runZonedGuarded<Future<void>>(() async {
    runApp(App(initialRoute));
  },  FirebaseCrashlytics.instance.recordError);
}
