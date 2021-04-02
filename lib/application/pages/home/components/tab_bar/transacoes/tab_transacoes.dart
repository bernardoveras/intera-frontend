import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intera/domain/models/intera.dart';
import 'package:intera/core/components/empty_state.dart';
import 'package:intera/core/settings.dart';
import '../../../../../../core/extensions/screen_util_extension.dart';
import 'item_transacoes.dart';

class TabTransacoes extends StatelessWidget {
  final List<Intera> interas;

  const TabTransacoes({Key? key, required this.interas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.height),
      child: interas.length > 0
          ? ListView.separated(
              separatorBuilder: (context, index) => Container(
                color: Colors.grey.shade200,
                height: 1.5.height,
              ),
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: interas.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => FadeInLeft(
                duration: Duration(milliseconds: 300),
                delay: Duration(milliseconds: index == 0 ? 0 : index * 200),
                child: ItemTransacoes(
                  index: index,
                  intera: interas[index],
                  isLastItem: index == (interas.length - 1),
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
