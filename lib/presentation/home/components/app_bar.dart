import 'package:flutter/material.dart';
import 'package:intera/presentation/home/components/nofitication_row.dart';
import 'package:intera/presentation/home/components/profile_name.dart';
import 'package:intera/presentation/home/components/profile_picture.dart';
import '../../../shared/extensions/screen_util_extension.dart';

class HomeAppBar extends PreferredSize {
  HomeAppBar({Key? key})
      : super(
          key: key,
          preferredSize: Size.fromHeight(100.height),
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20.height),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ProfilePicture(
                        url:
                            'https://avatars.githubusercontent.com/u/56937988?s=400&u=cf67cf7b78fc452958f03c63b16f29bb91881449&v=4',
                      ),
                      SizedBox(width: 20.width),
                      ProfileName(profileName: 'Bernardo'),
                    ],
                  ),
                  NotificationRow(
                    hasNotification: true,
                  ),
                ],
              ),
            ),
          ),
        );
}
