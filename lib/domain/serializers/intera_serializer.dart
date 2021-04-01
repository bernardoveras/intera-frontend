import 'package:intera/domain/models/intera.dart';
import 'package:intera/domain/serializers/json_serializer.dart';
import 'package:intera/domain/serializers/member_serializer.dart';

class InteraSerializer implements JsonSerializer<Intera> {
  final memberSerializer = MemberSerializer();
  @override
  Intera fromMap(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final name = json['name'] as String;
    final completed = json['completed'] as bool;
    final rawMembers = json['members'] as List;
    final total = json['total'] as double;

    final members = rawMembers
        .cast<Map<String, dynamic>>()
        .map(memberSerializer.fromMap)
        .toList();

    return Intera(
      id: id,
      name: name,
      completed: completed,
      members: members,
      total: total,
    );
  }

  @override
  Map<String, dynamic> mapOf(Intera intera) => <String, dynamic>{
        'id': intera.id,
        'name': intera.name,
        'completed': intera.completed,
        'total': intera.total,
        if (intera.members != null)
          'members': intera.members!.map(memberSerializer.mapOf),
      };
}
