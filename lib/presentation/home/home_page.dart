import 'package:flutter/material.dart';
import '../../shared/extensions/screen_util_extension.dart';
import 'components/components.dart';
import 'components/tab_bar/tab_bar.dart';
import 'components/tab_bar/tab_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20.width,
                right: 20.width,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TotalOfInteras(total: 10),
                ],
              ),
            ),
            TabBarComponent(tabController),
            TabViewComponent(tabController: tabController),
          ],
        ),
      ),
    );
  }
}
