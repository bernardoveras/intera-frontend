import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../shared/extensions/screen_util_extension.dart';
import '../../../../shared/theme/theme.dart';

class NotificationRow extends StatelessWidget {
  final bool hasNotification;

  const NotificationRow({Key? key, this.hasNotification = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        FadeInUp(
          from: 20,
          duration: Duration(milliseconds: 300),
          child: Row(
            children: [
              IconButton(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: Icon(
                  Icons.more_horiz,
                  size: 34.height,
                  color: Colors.grey,
                ),
                onPressed: () {
                  print('Tap Menu');
                },
              ),
              IconButton(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: Icon(
                  Icons.notifications,
                  size: 34.height,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  print('Tap Notification');
                },
              ),
            ],
          ),
        ),
        hasNotification == true
            ? Positioned(
                top: 6.height,
                right: 6.width,
                child: FlipInX(
                  delay: Duration(milliseconds: 400),
                  child: Container(
                    height: 16.height,
                    width: 16.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      margin: EdgeInsets.all(3.height),
                      decoration: BoxDecoration(
                        color: AppTheme.warning,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
