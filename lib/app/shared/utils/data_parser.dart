import 'package:intl/intl.dart';

String formatarSubtitulo(DateTime data) {
  final formatoHorario = DateFormat("HH:mm");
  final formatoDiaMes = DateFormat("dd/MM");
  return "${formatoDiaMes.format(data)} às ${formatoHorario.format(data)}";
}

String formatarMesAno(DateTime data) {
  final formato = DateFormat("MMM yyyy");
  return formato.format(data);
}

String formatarData(DateTime data) {
  final agora = DateTime.now();
  final formatoDiaMes = DateFormat("dd MMM", "pt_BR");

  String resultado = formatoDiaMes.format(data).replaceAll('.', '');

  resultado = resultado.substring(0, 3) +
      resultado[3].toUpperCase() +
      resultado.substring(4);

  if (agora.day == data.day &&
      agora.month == data.month &&
      agora.year == data.year) {
    return "Hoje, $resultado";
  } else {
    return resultado;
  }
}
