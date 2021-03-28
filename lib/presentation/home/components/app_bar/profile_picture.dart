import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/shared/navigation/routes.dart';
import 'package:intera/shared/services/connectivity_services.dart';
import 'package:intera/shared/settings.dart';
import '../../../../shared/extensions/screen_util_extension.dart';
import '../../../../shared/theme/theme.dart';

class ProfilePicture extends StatelessWidget {
  final ConnectivityService connectivityService;
  final String? image = Settings.user.value?.pictureUrl;

  ProfilePicture(this.connectivityService);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 20,
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () async {
          Get.toNamed(Routes.PROFILE);
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
          child: image != null && connectivityService.isConnected == true
              ? Padding(
                  padding: EdgeInsets.all(3.height),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(image!),
                  ),
                )
              : Obx(()=> Text(
                    Settings.user.value?.name?.substring(0, 1).toUpperCase() ??
                        'Sem nome'.substring(0, 1).toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                    ),
                  ),
              ),
        ),
      ),
    );
  }
}
