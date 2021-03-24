import 'package:flutter/material.dart';
import 'package:intera/presentation/home/components/total_of_interas.dart';
import '../../shared/extensions/screen_util_extension.dart';
import 'components/app_bar/app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              TotalOfInteras(total: 10),
            ],
          ),
        ),
      ),
    );
  }
}
