import 'package:intl/intl.dart';

String formatarValor(double valor) {
  String valorFormatado = NumberFormat('#,##0.00', 'pt_BR').format(valor);

  return valorFormatado;
}