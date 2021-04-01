import 'package:intera/domain/models/member.dart';

import 'json_serializer.dart';

class MemberSerializer implements JsonSerializer<Member> {
  @override
  Member fromMap(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final name = json['name'] as String;
    final email = json['email'] as String;
    final telefone = json['telefone'] as String;
    final valorPago = json['valorPago'] as double;

    return Member(
      id: id,
      name: name,
      email: email,
      telefone: telefone,
      valorPago: valorPago,
    );
  }

  @override
  Map<String, dynamic> mapOf(Member member) => <String, dynamic>{
        'id': member.id,
        'name': member.name,
        'email': member.email,
        'telefone': member.telefone,
        'valorPago': member.valorPago,
      };
}
