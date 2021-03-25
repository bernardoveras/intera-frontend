import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intera/shared/extensions/screen_util_extension.dart';

class LoginTextField extends StatefulWidget {
  final String? titleText;
  final String? hintText;
  final bool obscure;
  final TextStyle? style;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String? errorText;
  final Icon? preffixIcon;

  const LoginTextField({
    Key? key,
    this.titleText,
    this.hintText,
    this.obscure = false,
    this.style,
    this.focusNode,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.textInputAction,
    this.errorText,
    this.validator,
    this.preffixIcon,
  }) : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late bool showPass;

  @override
  void initState() {
    super.initState();
    showPass = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleText != null
            ? Text(
                widget.titleText!,
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              )
            : SizedBox.shrink(),
        SizedBox(height: widget.titleText != null ? 8.height : 0),
        TextFormField(
          focusNode: widget.focusNode,
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          readOnly: widget.readOnly,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          obscureText: showPass,
          style: widget.style != null
              ? widget.style!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: showPass == true ? 5 : null,
                )
              : TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: showPass == true ? 5 : null,
                ),
          autocorrect: false,
          decoration: InputDecoration(
            suffixIcon: widget.preffixIcon == null
                ? widget.errorText != null
                    ? Icon(Icons.error_rounded, color: Colors.red)
                    : widget.obscure
                        ? FadeInUp(
                            from: 10,
                            duration: Duration(milliseconds: 200),
                            child: GestureDetector(
                              onTap: () => setState(() => showPass = !showPass),
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                child: Icon(
                                  showPass
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                  color: Colors.grey,
                                  size: 20.height,
                                ),
                              ),
                            ),
                          )
                        : null
                : FadeInUp(
                    from: 10,
                    duration: Duration(milliseconds: 200),
                    child: widget.preffixIcon!,
                  ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.width,
              vertical: 10.height,
            ),
            filled: true,
            hintText: widget.hintText ?? widget.titleText,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
            border: outlineBorder(),
            errorBorder: outlineBorder(),
            enabledBorder: outlineBorder(),
            focusedBorder: outlineBorder(),
            disabledBorder: outlineBorder(),
            focusedErrorBorder: outlineBorder(),
          ),
          cursorColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  InputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    );
  }
}
