import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/extensions/screen_util_extension.dart';

class TabBarComponent extends StatelessWidget {
  final TabController tabController;

  const TabBarComponent(this.tabController) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.width),
      child: TabBar(
        indicatorWeight: 2,
        physics: BouncingScrollPhysics(),
        controller: tabController,
        labelPadding: EdgeInsets.only(right: 15.width, left: 15.width),
        labelColor: Theme.of(context).primaryColor,
        indicatorColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Get.isDarkMode ? Colors.grey.shade500 : Colors.grey,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        labelStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        tabs: [
          Tab(
            text: 'Interas',
          ),
          Tab(
            text: 'Transações',
          )
        ],
      ),
    );
  }
}
