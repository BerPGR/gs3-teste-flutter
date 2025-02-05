import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gs3/app/model/cartao_model.dart';
import 'package:gs3/app/model/lancamento_model.dart';
import 'package:gs3/app/shared/utils/parser.dart';
import 'package:gs3/app/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class UltimosLancamentos extends StatelessWidget {
  const UltimosLancamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Últimos lançamentos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Ver todos",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.chevron_right_outlined,
                  color: Color(0xFF3C6AB2),
                  size: 28,
                )
              ],
            )
          ],
        ),
        Consumer<HomeViewModel>(builder: (context, viewModel, child) {
          return ValueListenableBuilder<CartaoModel?>(
              valueListenable: viewModel.cartaoSelecionado,
              builder: (context, cartao, _) {
                if (cartao == null || cartao.lancamentos.isEmpty) {
                  return Center(child: Text("Nenhum lançamento disponível"));
                }

                final Map<String, List<LancamentoModel>> lancamentosAgrupados =
                    {};
                for (var lancamento in viewModel.ultimosLancamentos) {
                  String dataFormatada = formatarData(lancamento.data);
                  if (!lancamentosAgrupados.containsKey(dataFormatada)) {
                    lancamentosAgrupados[dataFormatada] = [];
                  }
                  lancamentosAgrupados[dataFormatada]!.add(lancamento);
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: lancamentosAgrupados.entries.map((entry) {
                    String data = entry.key;
                    List<LancamentoModel> lancamentos = entry.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            data,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),

                        ...lancamentos.map((lancamento) {
                          return ListTile(
                            leading: SvgPicture.asset(lancamento.imagem,
                                width: 40, height: 40),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("R\$${lancamento.valor.toStringAsFixed(2)}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                    Text("")
                                  ],
                                ),
                            title: Text(lancamento.descricao),
                            subtitle: Text(formatarSubtitulo(lancamento.data)),
                          );
                        })
                      ],
                    );
                  }).toList(),
                );
              });
        })
      ],
    );
  }
}
