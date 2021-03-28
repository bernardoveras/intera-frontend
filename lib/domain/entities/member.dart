import 'package:uuid/uuid.dart';

class Member {
  final  String? id = Uuid().v4();
  String nome;
  String? telefone;
  String? email;

  Member({required this.nome, this.telefone, this.email});
}
