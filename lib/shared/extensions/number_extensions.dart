import 'package:intl/intl.dart';

extension NumberToStringExtensions on int {
  String toReadableNumberString() {
    // var f = NumberFormat('#\u2030', 'de_DE');
    var f = NumberFormat.compact(locale: 'en_US');
    return f.format(this);
  }

  String toCurrencyString() {
    var f =
        NumberFormat.currency(locale: 'de_DE', symbol: '€', decimalDigits: 2);
    return f.format(this);
  }
}

extension DoubleToStringExtensions on double {
  String toCurrencyString() {
    var f =
        NumberFormat.currency(locale: 'de_DE', symbol: '€', decimalDigits: 2);
    return f.format(this);
  }
}
