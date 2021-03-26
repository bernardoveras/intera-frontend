import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intera/shared/extensions/screen_util_extension.dart';

class TitleComponent extends StatelessWidget {
  final String? title;
  final double? width;

  const TitleComponent({Key? key, this.title, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: Duration(milliseconds: 300),
      from: 30,
      child: Column(
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
          FadeInUp(
            duration: Duration(milliseconds: 200),
            delay: Duration(milliseconds: 580),
            from: 20,
            child: Container(
              color: Theme.of(context).primaryColor,
              width: 30.width,
              height: 4.height,
            ),
          ),
        ],
      ),
    );
  }
}
