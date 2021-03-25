class Intera {
  final String title;
  final double total;
  List<String> members;

  double get totalPago => 100.0;
  double get totalParaCada => (200 / members.length).roundToDouble();
  double get progress => (totalPago / total);

  Intera({
    required this.title,
    required this.members,
    this.total = 0.0,
  });
}
