import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/screen_util_extension.dart';

class EmptyStateComponent extends StatelessWidget {
  final String name;
  final String description;
  final String? buttonTitle;
  final Function()? onTap;

  const EmptyStateComponent({
    Key? key,
    required this.name,
    required this.description,
    this.buttonTitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      duration: Duration(milliseconds: 400),
      child: Padding(
        padding: EdgeInsets.only(top: 60.height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.height),
            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.height),
            onTap != null
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        elevation: 0,
                        shadowColor:
                            Theme.of(context).primaryColor.withOpacity(.2)),
                    onPressed: () {},
                    child: Text(
                      buttonTitle ?? 'OK',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
