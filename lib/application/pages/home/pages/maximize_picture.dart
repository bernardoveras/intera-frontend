import 'dart:convert';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/core/consts.dart';
import 'package:intera/core/extensions/screen_util_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/core/services/dialog_service.dart';
import 'package:intera/core/settings.dart';
import 'package:image_picker/image_picker.dart';

class MaximizePicture extends StatelessWidget {
  final IDialogService dialogService;
  final ILocalStorage storage;

  const MaximizePicture(
      {Key? key, required this.storage, required this.dialogService})
      : super(key: key);

  Future getImage() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      Settings.usernameImage?.value = await pickedFile.readAsBytes();

      String imageEncoded = base64Encode(Settings.usernameImage!.value!);
      await storage.add(PATH.USER_IMAGE, imageEncoded);
    }
  }

  Future deleteImage() async {
    await storage.remove(PATH.USER_IMAGE);

    Settings.usernameImage?.value = null;
  }

  Future showExcludeConfirmationDialog(BuildContext context) async {
    return await dialogService.confirmationDialog(
      name: 'Excluir foto',
      content: 'Você deseja mesmo excluir permanentemente sua foto?',
      confirmationText: 'Excluir',
      onConfirm: () async => await deleteImage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      behavior: HitTestBehavior.opaque,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white.withOpacity(0.85),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ZoomIn(
                      duration: Duration(milliseconds: 200),
                      child: GestureDetector(
                        onTap: () async {
                          if (Settings.usernameImage?.value == null) {
                            await getImage();
                          }
                        },
                        onLongPress: Settings.usernameImage?.value != null
                            ? () {
                                showExcludeConfirmationDialog(context);
                              }
                            : null,
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.radius),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20.0,
                              ),
                            ],
                            image: Settings.usernameImage?.value != null
                                ? DecorationImage(
                                    image: MemoryImage(
                                        Settings.usernameImage!.value!),
                                    fit: BoxFit.fill,
                                  )
                                : null,
                          ),
                          height: MediaQuery.of(context).size.width * 0.8,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Settings.usernameImage?.value == null
                              ? FadeInUp(
                                  duration: Duration(milliseconds: 200),
                                  delay: Duration(milliseconds: 250),
                                  from: 30,
                                  child: Center(
                                    child: Text(
                                      'Enviar uma imagem',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Circular',
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.height),
                    Settings.usernameImage?.value != null
                        ? FadeInUp(
                            from: 20,
                            delay: Duration(milliseconds: 200),
                            duration: Duration(milliseconds: 300),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () async {
                                        await showExcludeConfirmationDialog(
                                            context);
                                      },
                                      child: Text(
                                        'Excluir',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        side: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 40.width),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        await getImage();
                                      },
                                      child: Text(
                                        'Alterar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        elevation: 0,
                                        shadowColor: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              Positioned(
                top: 10.height,
                right: 10.width,
                child: SlideInRight(
                  delay: Duration(milliseconds: 100),
                  duration: Duration(milliseconds: 300),
                  child: SizedBox(
                    height: 30.height,
                    width: 30.width,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                        child: Icon(
                          Icons.close,
                          size: 20.height,
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
