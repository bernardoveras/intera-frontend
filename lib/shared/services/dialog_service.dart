import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/shared/theme/theme.dart';
import 'package:intera/shared/extensions/screen_util_extension.dart';

abstract class IDialogService {
  Future<void> confirmationDialog({
    String? title,
    TextStyle? titleStyle,
    String? content,
    TextStyle? contentStyle,
    String cancelText = 'Cancelar',
    TextStyle? cancelStyle,
    String confirmationText = 'Confirmar',
    TextStyle? confirmationStyle,
    Color? primaryColor,
    void Function()? onCancel,
    void Function()? onConfirm,
    bool closeOnConfirm = true,
    bool closeOnCancel = true,
  });
}

class DialogService extends IDialogService {
  @override
  Future<void> confirmationDialog({
    String? title,
    TextStyle? titleStyle,
    String? content,
    TextStyle? contentStyle,
    String cancelText = 'Cancelar',
    TextStyle? cancelStyle,
    String confirmationText = 'Confirmar',
    TextStyle? confirmationStyle,
    Color? primaryColor,
    void Function()? onCancel,
    void Function()? onConfirm,
    bool closeOnConfirm = true,
    bool closeOnCancel = true,
  }) async {
    return await Get.dialog(
      AlertDialog(
        title: title != null
            ? Text(
                title,
                style: titleStyle ??
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
              )
            : null,
        content: content != null
            ? Text(
                content,
                style: contentStyle ??
                    TextStyle(
                      fontSize: 16.sp,
                    ),
              )
            : null,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: primaryColor ?? AppTheme.primary,
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
              if (onCancel != null) onCancel();
              if (closeOnCancel == true) Get.back();
            },
          ),
          SizedBox(width: 5.width),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: primaryColor ?? AppTheme.primary,
                elevation: 0,
                shadowColor: primaryColor?.withOpacity(0.2) ??
                    AppTheme.primary.withOpacity(.2)),
            child: Text(
              confirmationText,
              style: confirmationStyle == null
                  ? TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    )
                  : confirmationStyle,
            ),
            onPressed: () {
              if (onConfirm != null) onConfirm();
              if (closeOnConfirm == true) Get.back();
            },
          )
        ],
      ),
    );
  }
}
