import 'package:flutter/material.dart';
import 'package:intera/domain/entities/intera.dart';
import 'package:intera/shared/extensions/formatter_extension.dart';
import '../../../../../shared/extensions/screen_util_extension.dart';

class ItemInteras extends StatelessWidget {
  final int index;
  final Intera intera;

  const ItemInteras({Key? key, required this.index, required this.intera})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: index == 0 ? 0 : 15.height,
        bottom: index == index - 1 ? 0 : 15.height,
      ),
      child: LayoutBuilder(builder: (context, sizes) {
        return Container(
          height: 90.height,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8.height),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 4.height,
                width: sizes.maxWidth * intera.progress,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.height),
                    topLeft: Radius.zero,
                    bottomRight: intera.progress < 100
                        ? Radius.zero
                        : Radius.circular(8.height),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.height),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.05),
                          child: Text(
                            '$index',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 20.width),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${intera.title} - ${Formatter.currency(intera.total)}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                                fontSize: 18.sp,
                              ),
                            ),
                            Container(
                              width: 200.width,
                              child: Text(
                                intera.members.join(', '),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Text(
                              '${Formatter.currency(intera.totalPago)} /${Formatter.currency(intera.total, false)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.grey,
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
            ],
          ),
        );
      }),
    );
  }
}
