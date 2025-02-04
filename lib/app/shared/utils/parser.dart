import 'package:intl/intl.dart';

String formatarDataHora(DateTime data) {
  final agora = DateTime.now();
  final formatoHorario = DateFormat("HH:mm");
  final formatoDiaMes = DateFormat("dd/MM");

  if (agora.day == data.day &&
      agora.month == data.month &&
      agora.year == data.year) {
    return "Hoje, ${DateFormat("dd MMM", "pt_BR").format(data)}";
  } else {
    return "${formatoDiaMes.format(data)} às ${formatoHorario.format(data)}";
  }
}

String formatarSubtitulo(DateTime data) {
  final agora = DateTime.now();
  final formatoDiaMes = DateFormat("dd MMM", "pt_BR");

  String resultado = formatoDiaMes.format(data).replaceAll('.','');

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
