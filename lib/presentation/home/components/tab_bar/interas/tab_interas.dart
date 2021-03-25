import 'package:flutter/material.dart';
import 'package:intera/domain/entities/intera.dart';
import 'package:intera/shared/components/empty_state.dart';
import '../../../../../shared/extensions/screen_util_extension.dart';
import 'item_interas.dart';

class TabInteras extends StatelessWidget {
  final List<Intera> interas;

  const TabInteras({Key? key, required this.interas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.height),
      child: interas.length > 0
          ? ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: interas.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ItemInteras(
                index: index,
                intera: interas[index],
              ),
            )
          : EmptyStateComponent(
              title: 'Crie uma intera',
              description: 'Parece que você ainda\nnão criou uma intera',
              buttonTitle: 'Criar uma intera agora!',
              onTap: () {},
            ),
    );
  }
}
