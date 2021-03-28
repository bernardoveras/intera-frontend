import 'package:flutter/material.dart';
import 'package:intera/shared/extensions/screen_util_extension.dart';

class ICheckBox extends StatefulWidget {
  final bool value;
  final Function(bool) onChanged;
  final String? title;
  final TextStyle? titleStyle;
  final Color? checkColor;
  final Color? uncheckColor;
  final BorderRadiusGeometry? radius;
  final double? width;
  final double? height;
  final Duration? duration;

  const ICheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.title,
    this.titleStyle,
    this.checkColor,
    this.uncheckColor,
    this.radius,
    this.width,
    this.height,
    this.duration,
  }) : super(key: key);

  @override
  _ICheckBoxState createState() => _ICheckBoxState();
}

class _ICheckBoxState extends State<ICheckBox> {
  late bool showIcon;
  void _onChanged(bool value) {
    setState(() => showIcon = value);
    widget.onChanged(value);
  }

  @override
  void initState() {
    super.initState();
    showIcon = widget.value;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onChanged(!widget.value);
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: widget.duration ?? Duration(milliseconds: 1000),
            width: widget.width ?? 24.width,
            height: widget.height ?? 24.height,
            curve: Curves.fastLinearToSlowEaseIn,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.value == false
                    ? Colors.grey.shade300
                    : Colors.transparent,
              ),
              color: widget.value == true
                  ? widget.checkColor ?? Theme.of(context).primaryColor
                  : widget.uncheckColor ?? Colors.grey.shade200,
              borderRadius: widget.radius ?? BorderRadius.circular(5.radius),
            ),
            child: TweenAnimationBuilder(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 500),
              tween: Tween(begin: 0.0, end: showIcon == true ? 0.0 : 20.0),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 700),
                opacity: showIcon == true ? 1.0 : 0.0,
                curve: Curves.fastLinearToSlowEaseIn,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 14.height,
                ),
              ),
              builder: (_, double value, child) {
                return Transform.translate(
                  offset: Offset(0.0, value),
                  child: child!,
                );
              },
            ),
          ),
          SizedBox(width: widget.title != null ? 8.width : 0),
          widget.title != null
              ? Text(
                  widget.title!,
                  style: widget.titleStyle ??
                      TextStyle(
                        color: Colors.grey.shade500,
                      ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
