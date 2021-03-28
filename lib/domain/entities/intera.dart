import 'package:uuid/uuid.dart';

import 'member.dart';

class Intera {
  final String? id = Uuid().v4();
  final String title;
  final double total;
  bool completed;
  List<Member>? members;

  double get totalPago =>
      members?.fold<double>(0.0, (p, c) => p + c.valorPago) ?? 0.0;

  double get totalParaCada => (200 / members!.length).roundToDouble();
  double get progress => (totalPago / total);

  Intera({
    required this.title,
    this.members,
    this.total = 0.0,
    this.completed = false,
  }) {
    if (members == null) members = <Member>[];
  }
}
