import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/core/components/bottom_sheet.dart';
import 'package:intera/core/consts.dart';
import 'package:intera/core/settings.dart';
import 'package:intera/core/theme/theme.dart';
import '../../../../../core/extensions/screen_util_extension.dart';

class NotificationRow extends StatelessWidget {
  final bool hasNotification;
  final ILocalStorage storage;
  final Future<void> Function() logout;

  const NotificationRow({
    Key? key,
    required this.storage,
    required this.logout,
    this.hasNotification = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      duration: Duration(milliseconds: 300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 34.height,
            padding: EdgeInsets.zero,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.more_horiz,
              size: 34.height,
              color: Get.isDarkMode ? Colors.white : Colors.grey,
            ),
            onPressed: () {
              Get.bottomSheet(
                MaterialBottomSheet(
                  itens: [
                    Obx(
                      () => Item(
                        name: 'Dark mode',
                        isChecked: Settings.theme.value == ThemeMode.dark
                            ? true
                            : false,
                        onTap: () async {
                          await AppTheme.changeTheme(
                            Settings.theme.value == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light,
                          );
                        },
                      ),
                    ),
                    Obx(
                      () => Item(
                        name: 'Exibir total das interas',
                        isChecked: Settings.exibirTotalDeInteras.value ?? false,
                        onTap: () async {
                          Settings.exibirTotalDeInteras.value =
                              !Settings.exibirTotalDeInteras.value!;
                          await storage.add(
                            PATH.EXIBIR_TOTAL_INTERAS,
                            Settings.exibirTotalDeInteras.value.toString(),
                          );
                        },
                      ),
                    ),
                    Item(
                      name: 'Sair da conta',
                      titleColor: Colors.red,
                      onTap: () async {
                        await logout();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          IconButton(
            iconSize: 34.height,
            padding: EdgeInsets.zero,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              hasNotification == true
                  ? Icons.notifications_rounded
                  : Icons.notifications_none_rounded,
              size: 34.height,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              print('Tap Notification');
            },
          ),
        ],
      ),
    );
  }
}
