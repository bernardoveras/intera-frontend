import 'package:flutter/material.dart';
import '../../shared/extensions/screen_util_extension.dart';
import 'components/app_bar/app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
    );
  }
}
