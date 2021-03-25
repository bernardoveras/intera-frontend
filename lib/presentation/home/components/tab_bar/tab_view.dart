import 'package:flutter/material.dart';
import 'package:intera/domain/entities/intera.dart';
import '../../../../shared/extensions/screen_util_extension.dart';
import 'interas/tab_interas.dart';

class TabViewComponent extends StatelessWidget {
  final TabController tabController;
  final List<Intera> interas;

  TabViewComponent({Key? key, required this.tabController, required this.interas}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        physics: BouncingScrollPhysics(),
        children: [
          TabInteras(interas: interas),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('1', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
