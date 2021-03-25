import 'package:intl/intl.dart';

class Formatter {
  static String currency(num value, [bool useSymbol = true]) {
    var formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: useSymbol == true ? 'R\$' : '',
    );
    return formatter.format(value);
  }
}
