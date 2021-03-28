import 'package:uuid/uuid.dart';

class Member {
  final String? id = Uuid().v4();
  String nome;
  String? telefone;
  String? email;
  double valorPago;
  bool get pagou => valorPago > 0.0;

  Member({
    required this.nome,
    this.telefone,
    this.email,
    this.valorPago = 0.0,
  });
}
