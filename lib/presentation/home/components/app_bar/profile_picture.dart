import 'dart:typed_data';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intera/presentation/home/pages/maximize_picture.dart';
import 'package:intera/shared/helpers/theme_helper.dart';
import 'package:intera/shared/settings.dart';
import '../../../../shared/extensions/screen_util_extension.dart';
import '../../../../shared/theme/theme.dart';

class ProfilePicture extends StatelessWidget {
  final Uint8List? image;

  const ProfilePicture({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 20,
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () async {
          AppTheme.changeStatusBar<Dark>(SystemUiOverlayStyle(
            statusBarColor: Colors.white.withOpacity(0.85),
          ));
          await Get.dialog(
            MaximizePicture(
              storage: Get.find(),
              dialogService: Get.find(),
            ),
          );
          AppTheme.changeStatusBar<Dark>();
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 60.height,
          width: 60.width,
          alignment: image != null ? null : Alignment.center,
          decoration: BoxDecoration(
            border: image != null
                ? Border.all(color: AppTheme.primary, width: 3.width)
                : null,
            color: image != null ? null : Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: image != null
              ? Padding(
                  padding: EdgeInsets.all(3.height),
                  child: CircleAvatar(
                    backgroundImage: MemoryImage(image!),
                  ),
                )
              : Text(
                  Settings.user?.name ??
                      'Sem nome'.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                  ),
                ),
        ),
      ),
    );
  }
}
