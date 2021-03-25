import 'package:flutter/material.dart';
import 'package:intera/shared/settings.dart';
import 'package:intera/shared/theme/theme.dart';
import '../../shared/extensions/screen_util_extension.dart';

class MaterialBottomSheet extends StatefulWidget {
  @override
  _MaterialBottomSheetState createState() => _MaterialBottomSheetState();
}

class _MaterialBottomSheetState extends State<MaterialBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.height),
          topRight: Radius.circular(20.height),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20,
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(50.height),
              ),
              width: 80,
            ),
          ),
          Positioned(
            top: 50.height,
            left: 25.width,
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Item(
                  title: 'Dark mode',
                  isChecked: Settings.theme == ThemeMode.dark ? true : false,
                  onTap: () {
                    setState(() {
                      AppTheme.changeTheme(
                        Settings.theme == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light,
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function()? onTap;

  const Item(
      {Key? key, required this.title, required this.isChecked, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 50.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dark mode',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 24.height,
              width: 24.width,
              child: Checkbox(
                value: isChecked,
                checkColor: Colors.white,
                overlayColor: MaterialStateProperty.all<Color>(
                  Colors.transparent,
                ),
                fillColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: onTap != null
                    ? (val) {
                        onTap!();
                      }
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
