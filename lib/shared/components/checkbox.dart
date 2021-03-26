import 'package:animate_do/animate_do.dart';
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
  late AnimationController _upAnimController;

  void _onChanged(bool value) {
    if (value == true) {
      _upAnimController.forward();
    } else {
      _upAnimController.reverse();
    }

    widget.onChanged(value);
  }

  @override
  void dispose() {
    _upAnimController.dispose();
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
            duration: widget.duration ?? Duration(milliseconds: 200),
            width: widget.width ?? 24.width,
            height: widget.height ?? 24.height,
            decoration: BoxDecoration(
              color: widget.value == true
                  ? widget.checkColor ?? Theme.of(context).primaryColor
                  : widget.uncheckColor ?? Colors.grey.shade200,
              borderRadius: widget.radius ?? BorderRadius.circular(5.radius),
            ),
            child: FadeInUp(
              manualTrigger: true,
              animate: false,
              controller: (controller) {
                _upAnimController = controller;
                if (widget.value == true) _upAnimController.forward();
              },
              duration: widget.duration ?? Duration(milliseconds: 250),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 14.height,
              ),
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
