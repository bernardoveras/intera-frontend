import 'package:flutter/material.dart';
import '../../../../../shared/extensions/screen_util_extension.dart';
import 'item_interas.dart';

class TabInteras extends StatelessWidget {
  final List<String>? interas;

  const TabInteras({Key? key, required this.interas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(20.height),
      child: interas != null
          ? ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: interas!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ItemInteras(
                title: interas![index],
                index: index,
                persons: 'Bernardo, Amanda, Junior, Juan, Diniz, Pedro, PH, Leo, Karinne',
              ),
            )
          : Center(child: Text('Carregando')),
    );
  }
}
