import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'member.dart';

// ignore: must_be_immutable
class Intera extends Equatable {
  final String id;
  final String name;
  final double total;
  bool completed;
  List<Member>? members;

  double get totalPago =>
      members?.fold<double>(0.0, (p, c) => p + c.valorPago) ?? 0.0;

  double get totalParaCada => (200 / members!.length).roundToDouble();
  double get progress => (totalPago / total);

  Intera({
    required this.id,
    required this.name,
    this.members,
    this.total = 0.0,
    this.completed = false,
  })  : assert(id.isNotEmpty),
        assert(name.isNotEmpty) {
    if (members == null) members = <Member>[];
  }

  @override
  List<Object?> get props => [id, name, members, total, completed];
}
