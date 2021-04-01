import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/core/settings.dart';
import '../../../../../core/extensions/screen_util_extension.dart';

class ProfileName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      duration: Duration(milliseconds: 300),
      child: Column(
        key: key,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WELCOME',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          Container(
            width: 160.width,
            child: Obx(
              () => AutoSizeText(
                Settings.user.value?.name ?? 'Sem name',
                maxLines: 1,
                maxFontSize: 24,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
