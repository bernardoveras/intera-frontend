import 'package:flutter/material.dart';
import '../../../../../shared/extensions/screen_util_extension.dart';

class ItemInteras extends StatelessWidget {
  final int index;
  final String persons;
  final String title;

  const ItemInteras({Key? key, required this.index, required this.persons, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: index == 0 ? 0 : 15.height,
        bottom: index == index - 1 ? 0 : 15.height,
      ),
      child: Container(
        height: 50.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Text('$index'),
                ),
                SizedBox(width: 20.width),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    Container(
                      width: 200.width,
                      child: Text(
                        persons,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.grey,
              size: 24.height,
            )
          ],
        ),
      ),
    );
  }
}
