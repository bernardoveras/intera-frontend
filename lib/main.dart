import 'package:flutter/widgets.dart';
import 'app.dart';
import 'initializer.dart';
import 'shared/navigation/routes.dart';

void main() async {
  await Initializer.init();
  var initialRoute = await Routes.initialRoute;

  runApp(App(initialRoute));
}