import 'package:flutter/material.dart';
import '../../../../shared/extensions/screen_util_extension.dart';
import 'interas/tab_interas.dart';

class TabViewComponent extends StatelessWidget {
  final TabController tabController;
  final List<String> interas = [
    'Teste 1',
    'Teste 2',
    'Teste 3',
    'Teste 4',
    'Teste 5',
    'Teste 6',
    'Teste 7',
    'Teste 8',
    'Teste 9',
    'Teste 10',
  ];

  TabViewComponent({Key? key, required this.tabController}) : super(key: key);
  
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
