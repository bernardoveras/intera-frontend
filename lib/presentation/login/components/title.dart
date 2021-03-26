import 'package:flutter/material.dart';
import 'package:intera/shared/extensions/screen_util_extension.dart';

class TitleComponent extends StatelessWidget {
  final String? title;
  final double? width;

  const TitleComponent({Key? key, this.title, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width ?? 160.width,
          alignment: Alignment.centerLeft,
          child: Text(
            title ?? 'Faça o Login',
            maxLines: 2,
            style: TextStyle(
              color: Colors.black,
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20.height),
        Container(
          color: Theme.of(context).primaryColor,
          width: 30.width,
          height: 4.height,
        ),
      ],
    );
  }
}
