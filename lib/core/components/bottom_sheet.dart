import 'package:flutter/material.dart';
import '../../core/extensions/screen_util_extension.dart';

class MaterialBottomSheet extends StatefulWidget {
  final List<Widget>? itens;

  const MaterialBottomSheet({Key? key, this.itens}) : super(key: key);
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
          topLeft: Radius.circular(20.radius),
          topRight: Radius.circular(20.radius),
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
                borderRadius: BorderRadius.circular(50.radius),
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
              children: widget.itens ?? [],
            ),
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String name;
  final Color? titleColor;
  final bool? isChecked;
  final Function()? onTap;

  const Item({Key? key, required this.name, this.isChecked, this.onTap, this.titleColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: titleColor ?? Colors.black,
                  ),
                ),
                isChecked != null
                    ? SizedBox(
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
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: onTap != null
                              ? (val) {
                                  onTap!();
                                }
                              : null,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
          Container(
            height: 2,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(100.radius),
            ),
          ),
        ],
      ),
    );
  }
}
