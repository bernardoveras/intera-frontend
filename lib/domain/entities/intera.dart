class Intera {
  final String title;
  final double total;
  List<String> members;
  double get totalParaCada => (200 / members.length).roundToDouble();

  Intera({
    required this.title,
    required this.members,
    this.total = 0.0,
  });
}
