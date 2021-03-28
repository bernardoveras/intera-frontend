import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intera/shared/settings.dart';
import '../../../../shared/extensions/screen_util_extension.dart';
import 'components.dart';

class HomeAppBar extends PreferredSize {
  final Future<void> Function() logout;
  HomeAppBar({
    Key? key,
    required this.logout,
  }) : super(
          key: key,
          preferredSize: Size.fromHeight(124.height),
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20.height),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ProfilePicture(Get.find()),
                      SizedBox(width: 20.width),
                      ProfileName(),
                    ],
                  ),
                  NotificationRow(
                    hasNotification: false,
                    storage: Get.find(),
                    logout: logout,
                  ),
                ],
              ),
            ),
          ),
        );
}
