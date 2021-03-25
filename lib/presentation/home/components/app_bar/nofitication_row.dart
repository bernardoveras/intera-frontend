import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/extensions/screen_util_extension.dart';

class NotificationRow extends StatelessWidget {
  final bool hasNotification;

  const NotificationRow({Key? key, this.hasNotification = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      duration: Duration(milliseconds: 300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 34.height,
            padding: EdgeInsets.zero,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.more_horiz,
              size: 34.height,
              color: Get.isDarkMode ? Colors.white : Colors.grey,
            ),
            onPressed: () {
              print('Tap Menu');
            },
          ),
          IconButton(
            iconSize: 34.height,
            padding: EdgeInsets.zero,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              hasNotification == true
                  ? Icons.notifications_rounded
                  : Icons.notifications_none_rounded,
              size: 34.height,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              print('Tap Notification');
            },
          ),
        ],
      ),
    );
  }
}
