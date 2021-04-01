import 'package:get/get.dart';
import 'package:intera/domain/models/member.dart';
import 'package:intera/domain/usecases/logout.dart';
import 'package:intera/domain/models/intera.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  late ILogout _logout;

  HomeController({required ILogout logout}) {
    _logout = logout;
  }

  double totalDasInteras = 0.0;

  List<Intera> interas = <Intera>[
    Intera(id: Uuid().v4(), name: 'Carnaval', total: 200, members: [
      Member(id: Uuid().v4(), name: 'Juan Veras'),
      Member(id: Uuid().v4(), name: 'Junior Veras'),
      Member(id: Uuid().v4(), name: 'PH', valorPago: 66),
    ]),
    Intera(id: Uuid().v4(), name: 'Carnaval', total: 200, members: [
      Member(id: Uuid().v4(), name: 'Juan Veras'),
      Member(id: Uuid().v4(), name: 'Junior Veras'),
      Member(id: Uuid().v4(), name: 'PH', valorPago: 66),
    ]),
  ];

  Future<void> logout() async {
    await _logout();
  }
}
