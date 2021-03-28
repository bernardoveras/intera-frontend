import 'package:get/get.dart';
import 'package:intera/domain/entities/member.dart';
import 'package:intera/domain/usecases/logout.dart';
import 'package:intera/domain/entities/intera.dart';

class HomeController extends GetxController {
  late ILogout _logout;

  HomeController({required ILogout logout}) {
    _logout = logout;
  }

  double totalDasInteras = 0.0;

  List<Intera> interas = <Intera>[
    Intera(
      title: 'Carnaval',
      total: 200,
      members: [
        Member(nome: 'Juan Veras'),
        Member(nome: 'Junior Veras'),
        Member(nome: 'PH',valorPago: 66),
      ]
    ),
  ];

  Future<void> logout() async {
    await _logout();
    
  }
}
