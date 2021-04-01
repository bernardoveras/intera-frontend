import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intera/domain/models/intera.dart';
import 'package:intera/core/components/empty_state.dart';
import 'package:intera/core/settings.dart';
import '../../../../../../core/extensions/screen_util_extension.dart';
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
                color: Settings.theme.value == ThemeMode.light ? Colors.grey.shade300 : Colors.grey.shade700,
              ),
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: interas.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => FadeInLeft(
                duration: Duration(milliseconds: 300),
                delay: Duration(milliseconds: index == 0 ? 0 : index * 200),
                child: ItemInteras(
                  index: index,
                  intera: interas[index],
                ),
              ),
            )
          : EmptyStateComponent(
              name: 'Crie uma intera',
              description: 'Parece que você ainda\nnão criou uma intera',
              buttonTitle: 'Criar uma intera agora!',
              onTap: () {},
            ),
    );
  }
}
