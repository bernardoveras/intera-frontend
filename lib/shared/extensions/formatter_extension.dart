import 'package:intl/intl.dart';

class Formatter {
  static String currency(num value) {
    var formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    );
    return formatter.format(value);
  }
}
