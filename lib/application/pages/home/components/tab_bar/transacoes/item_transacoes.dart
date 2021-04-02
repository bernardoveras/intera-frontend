import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intera/core/settings.dart';
import 'package:intera/domain/models/intera.dart';
import '../../../../../../core/extensions/screen_util_extension.dart';

class ItemTransacoes extends StatelessWidget {
  final int index;
  final Intera intera;
  final bool isLastItem;

  const ItemTransacoes({
    Key? key,
    required this.index,
    required this.intera,
    required this.isLastItem,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, sizes) {
      return Container(
        height: 75.height,
        padding: EdgeInsets.symmetric(horizontal: 20.height),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: Settings.theme.value == ThemeMode.light
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5.0,
                  ),
                ]
              : null,
          borderRadius: BorderRadius.only(
            topLeft: index == 0 ? Radius.circular(8.radius) : Radius.zero,
            topRight: index == 0 ? Radius.circular(8.radius) : Radius.zero,
            bottomLeft: isLastItem ? Radius.circular(8.radius) : Radius.zero,
            bottomRight: isLastItem ? Radius.circular(8.radius) : Radius.zero,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Settings.theme.value == ThemeMode.dark
                  ? Colors.white.withOpacity(0.05)
                  : Colors.grey.shade200,
              child: Text(
                '💒',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 165.width,
                  child: AutoSizeText(
                    '${intera.name} pago por Gloria',
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade900,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                Container(
                  width: 165.width,
                  child: AutoSizeText(
                    '27 de março, 15:27 AM',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.greenAccent.shade400,
                  size: 20.height,
                ),
                SizedBox(width: 8.width),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                    children: [
                      TextSpan(
                        text: "R\$ ",
                      ),
                      TextSpan(
                        text: "20,00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
