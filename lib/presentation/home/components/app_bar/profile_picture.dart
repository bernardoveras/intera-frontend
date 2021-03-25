import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intera/shared/settings.dart';
import '../../../../shared/extensions/screen_util_extension.dart';
import '../../../../shared/theme/theme.dart';

class ProfilePicture extends StatelessWidget {
  final String? url;

  const ProfilePicture({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 20,
      duration: Duration(milliseconds: 300),
      child: Container(
        height: 60.height,
        width: 60.width,
        alignment: url != null ? null : Alignment.center,
        decoration: BoxDecoration(
          border: url != null
              ? Border.all(color: AppTheme.primary, width: 3.width)
              : null,
          color: url != null ? null : Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        child: url != null
            ? Padding(
                padding: EdgeInsets.all(3.height),
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    url!,
                  ),
                ),
              )
            : Text(
                Settings.username.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 24.sp,
                ),
              ),
      ),
    );
  }
}
