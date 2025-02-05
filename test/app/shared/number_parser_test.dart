import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('Testando formatação de número', () {
    test('Deve formatar corretamente 7894.50 para 7.894,50', () {
      double valor = 7894.50;
      String formato = NumberFormat('#,##0.00', 'pt_BR').format(valor);

      // Verifica se o valor formatado é igual ao esperado
      expect(formato, equals('7.894,50'));
    });

    test('Deve formatar corretamente 1000.99 para 1.000,99', () {
      double valor = 1000.99;
      String formato = NumberFormat('#,##0.00', 'pt_BR').format(valor);

      // Verifica se o valor formatado é igual ao esperado
      expect(formato, equals('1.000,99'));
    });

    test('Deve formatar corretamente 899.99 para 899,99', () {
      double valor = 899.99;
      String formato = NumberFormat('#,##0.00', 'pt_BR').format(valor);
      expect(formato, equals('899,99'));
    });
  });
}
