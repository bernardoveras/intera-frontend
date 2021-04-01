import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Member extends Equatable {
  final String id;
  String name;
  String? telefone;
  String? email;
  double valorPago;
  bool get pagou => valorPago > 0.0;

  Member({
    required this.id,
    required this.name,
    this.telefone,
    this.email,
    this.valorPago = 0.0,
  })  : assert(id.isNotEmpty),
        assert(name.isNotEmpty),
        assert(valorPago >= 0.0);

  @override
  List<Object?> get props => [id, name, telefone, email, valorPago];
}
