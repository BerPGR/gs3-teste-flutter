import "package:flutter_test/flutter_test.dart";
import "package:gs3/app/shared/utils/parser.dart";
import "package:intl/date_symbol_data_local.dart";
import "package:intl/intl.dart";

void main() {
  setUpAll(() async {
    await initializeDateFormatting("pt_BR", null);
  });

  group("Testes de formatação de data e hora", () {
    test("Deve formatar a data e hora corretamente para um dia normal", () {
      final dataTeste = DateTime(2024, 9, 3, 9, 34);
      expect(formatarSubtitulo(dataTeste), "03/09 às 09:34");
    });

    test("Deve formatar a data corretamente para um subtítulo", () {
      final dataTeste = DateTime(2024, 9, 3);
      expect(formatarSubtitulo(dataTeste), "03/09 às 00:00");
    });

    test("Deve formatar corretamente quando a data for hoje", () {
      final hoje = DateTime.now();
      final formatoDiaMes = DateFormat("dd MMM", "pt_BR");

      String resultado = formatoDiaMes.format(hoje).replaceAll('.', '');

      resultado = resultado.substring(0, 3) +
          resultado[3].toUpperCase() +
          resultado.substring(4);

      final esperado = "Hoje, $resultado";

      expect(formatarData(hoje), esperado);
    });
  });
}
