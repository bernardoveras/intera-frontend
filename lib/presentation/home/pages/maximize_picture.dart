import 'dart:convert';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/shared/consts.dart';
import 'package:intera/shared/extensions/screen_util_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/shared/settings.dart';
import 'package:image_picker/image_picker.dart';

class MaximizePicture extends StatelessWidget {
  final ILocalStorage storage;

  const MaximizePicture({Key? key, required this.storage}) : super(key: key);

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
    return await Get.dialog(
      AlertDialog(
        title: Text("Excluir foto"),
        content: Text("Você deseja mesmo excluir permanentemente sua foto?"),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              child: Text(
                "Cancelar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Circular',
                  color: Colors.grey.shade900,
                ),
              ),
              onPressed: () => Get.back()),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                elevation: 0,
                shadowColor: Theme.of(context).primaryColor.withOpacity(.2)),
            child: Text(
              'Excluir',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              await deleteImage();
              Get.back();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        behavior: HitTestBehavior.opaque,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
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
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          primary:
                                              Theme.of(context).primaryColor,
                                          side: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
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
                                          primary:
                                              Theme.of(context).primaryColor,
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
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          foregroundColor: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
