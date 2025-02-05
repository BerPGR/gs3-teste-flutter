import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gs3/app/model/lancamento_model.dart';
import 'package:gs3/app/shared/utils/data_parser.dart';
import 'package:gs3/app/shared/utils/number_parser.dart';

void mostrarDetalhesLancamento(
    BuildContext context, LancamentoModel lancamento) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Center(
                child: SvgPicture.asset(lancamento.imagem, width: 50, height: 50),
              ),
              Text(
                "Compra - ${lancamento.descricao}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Data da compra - ${formatarData(lancamento.data)}",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                "Valor: R\$${formatarValor(lancamento.valor)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Fechar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3C6AB2)),),
              )
            ],
          ),
        ),
      );
    },
  );
}
