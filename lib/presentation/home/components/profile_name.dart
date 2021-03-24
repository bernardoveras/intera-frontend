import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../shared/extensions/screen_util_extension.dart';

class ProfileName extends StatelessWidget {
  final String profileName;

  const ProfileName({Key? key, required this.profileName}) : super(key: key);

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
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          Container(
            width: 160.width,
            child: Text(
              profileName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
