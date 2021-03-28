import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/shared/extensions/screen_util_extension.dart';
import 'package:ndialog/ndialog.dart';

abstract class IDialogService {
  Future<void> confirmationDialog({
    String? title,
    TextStyle? titleStyle,
    String? content,
    TextStyle? contentStyle,
    String? cancelText,
    TextStyle? cancelStyle,
    String confirmationText = 'Confirmar',
    TextStyle? confirmationStyle,
    Color? primaryColor,
    void Function()? onCancel,
    void Function()? onConfirm,
    bool closeOnConfirm = true,
    bool closeOnCancel = true,
    double? radius,
    Color? backgroundColor,
    Alignment alignment = Alignment.centerLeft,
    TextAlign textAlign = TextAlign.left,
  });
}

class DialogService extends IDialogService {
  @override
  Future<void> confirmationDialog({
    String? title,
    TextStyle? titleStyle,
    String? content,
    TextStyle? contentStyle,
    String? cancelText,
    TextStyle? cancelStyle,
    String confirmationText = 'Confirmar',
    TextStyle? confirmationStyle,
    Color? primaryColor,
    void Function()? onCancel,
    void Function()? onConfirm,
    bool closeOnConfirm = true,
    bool closeOnCancel = true,
    double? radius,
    Color? backgroundColor,
    Alignment alignment = Alignment.centerLeft,
    TextAlign textAlign = TextAlign.left,
  }) async {
    await NDialog(
      title: title != null
          ? Padding(
              padding: EdgeInsets.all(20.height),
              child: Align(
                alignment: alignment,
                child: Text(
                  title,
                  textAlign: textAlign,
                  style: titleStyle ??
                      TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            )
          : SizedBox(),
      content: content != null
          ? Padding(
              padding: EdgeInsets.only(left: 20.width, right: 20.width),
              child: Text(
                content,
                textAlign: textAlign,
                style: contentStyle ??
                    TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18.sp,
                    ),
              ),
            )
          : SizedBox(),
      dialogStyle: DialogStyle(
        borderRadius: BorderRadius.circular(radius ?? 16.radius),
        backgroundColor: backgroundColor,
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.height),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            children: [
              if (cancelText != null)
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(
                        (MediaQuery.of(Get.context!).size.width / 2) - 50,
                        40.height),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.radius),
                    ),
                    primary:
                        primaryColor ?? Theme.of(Get.context!).primaryColor,
                  ),
                  child: Text(
                    cancelText,
                    style: cancelStyle == null
                        ? TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Circular',
                            color: Colors.grey.shade900,
                            fontSize: 14.sp,
                          )
                        : cancelStyle,
                  ),
                  onPressed: () {
                    onCancel?.call();
                    if (closeOnCancel == true) Get.back();
                  },
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    cancelText != null
                        ? (MediaQuery.of(Get.context!).size.width / 2) - 50
                        : MediaQuery.of(Get.context!).size.width,
                    40.height,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.radius),
                  ),
                  primary: Theme.of(Get.context!).primaryColor,
                  elevation: 0,
                  shadowColor:
                      Theme.of(Get.context!).primaryColor.withOpacity(0.2),
                ),
                child: Text(
                  confirmationText,
                  style: confirmationStyle ??
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                ),
                onPressed: () {
                  onConfirm?.call();
                  if (closeOnConfirm == true) Get.back();
                },
              ),
            ],
          ),
        ),
      ],
    ).show(
      Get.context!,
      transitionType: DialogTransitionType.BottomToTop,
      transitionDuration: Duration(milliseconds: 200),
    );
    // return await Get.dialog(
    //   AlertDialog(
    //     title: title != null
    //         ? Text(
    //             title,
    //             style: titleStyle ??
    //                 TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 20.sp,
    //                 ),
    //           )
    //         : null,
    //     content: content != null
    //         ? Text(
    //             content,
    //             style: contentStyle ??
    //                 TextStyle(
    //                   fontSize: 16.sp,
    //                 ),
    //           )
    //         : null,
    //     actions: [
    //       TextButton(
    //         style: TextButton.styleFrom(
    //           primary: primaryColor ?? AppTheme.primary,
    //         ),
    //         child: Text(
    //           cancelText,
    //           style: cancelStyle == null
    //               ? TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontFamily: 'Circular',
    //                   color: Colors.grey.shade900,
    //                   fontSize: 14.sp,
    //                 )
    //               : cancelStyle,
    //         ),
    //         onPressed: () {
    //           if (onCancel != null) onCancel();
    //           if (closeOnCancel == true) Get.back();
    //         },
    //       ),
    //       SizedBox(width: 5.width),
    //       ElevatedButton(
    //         style: ElevatedButton.styleFrom(
    //             primary: primaryColor ?? AppTheme.primary,
    //             elevation: 0,
    //             shadowColor: primaryColor?.withOpacity(0.2) ??
    //                 AppTheme.primary.withOpacity(.2)),
    //         child: Text(
    //           confirmationText,
    //           style: confirmationStyle == null
    //               ? TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 14.sp,
    //                 )
    //               : confirmationStyle,
    //         ),
    //         onPressed: () {
    //           if (onConfirm != null) onConfirm();
    //           if (closeOnConfirm == true) Get.back();
    //         },
    //       )
    //     ],
    //   ),
    // );
  }
}
