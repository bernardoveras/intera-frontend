import 'package:uuid/uuid.dart';

import 'member.dart';

class Intera {
  final String? id = Uuid().v4();
  final String title;
  final double total;
  List<Member>? members;

  double get totalPago => 100.0;
  double get totalParaCada => (200 / members!.length).roundToDouble();
  double get progress => (totalPago / total);

  Intera({
    required this.title,
    this.members,
    this.total = 0.0,
  }) {
    if (members == null) members = <Member>[];
  }
}
