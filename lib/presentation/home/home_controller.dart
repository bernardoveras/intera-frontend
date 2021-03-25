import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/domain/entities/intera.dart';
import 'package:intera/shared/settings.dart';

class HomeController extends GetxController {
  double totalDasInteras = 0.0;

  List<Intera> interas = <Intera>[
    Intera(
      title: 'Carnaval',
      members: ['Bernardo', 'Juan', 'Brenda', 'VT', 'Alafe', 'Pedro', 'PH'],
      total: 200,
    ),
  ];  
}
