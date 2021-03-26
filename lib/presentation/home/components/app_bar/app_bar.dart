import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intera/shared/settings.dart';
import '../../../../shared/extensions/screen_util_extension.dart';
import 'components.dart';

class HomeAppBar extends PreferredSize {
  HomeAppBar({Key? key})
      : super(
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
                      Obx(() =>
                          ProfilePicture(image: Settings.usernameImage?.value)),
                      SizedBox(width: 20.width),
                      ProfileName(
                          profileName: Settings.user?.name ?? 'Sem nome'),
                    ],
                  ),
                  NotificationRow(
                    hasNotification: false,
                    storage: Get.find(),
                  ),
                ],
              ),
            ),
          ),
        );
}
