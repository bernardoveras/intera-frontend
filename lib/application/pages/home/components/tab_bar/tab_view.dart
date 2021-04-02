import 'package:flutter/material.dart';
import 'package:intera/application/pages/home/components/tab_bar/transacoes/tab_transacoes.dart';
import 'package:intera/domain/models/intera.dart';
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
          TabTransacoes(interas: interas),
        ],
      ),
    );
  }
}
