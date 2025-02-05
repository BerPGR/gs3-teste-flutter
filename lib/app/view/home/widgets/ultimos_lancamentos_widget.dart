import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gs3/app/model/cartao_model.dart';
import 'package:gs3/app/model/lancamento_model.dart';
import 'package:gs3/app/shared/utils/data_parser.dart';
import 'package:gs3/app/shared/utils/number_parser.dart';
import 'package:gs3/app/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:gs3/app/shared/utils/show_bottom_dialog.dart';

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
            GestureDetector(
              onTap: () { 
                final cartaoAtual = context.read<HomeViewModel>().cartaoSelecionado.value;
                if (cartaoAtual != null) {
                  Navigator.of(context).pushNamed('/posting', arguments: {'cartao': cartaoAtual, 'lancamentos': cartaoAtual.postings});}
                },
              child: Row(
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
              ),
            )
          ],
        ),
        Consumer<HomeViewModel>(builder: (context, viewModel, child) {
          return ValueListenableBuilder<CartaoModel?>(
              valueListenable: viewModel.cartaoSelecionado,
              builder: (context, cartao, _) {
                if (cartao == null || cartao.postings.isEmpty) {
                  return Center(child: Text("Nenhum lançamento disponível"));
                }

                final Map<String, List<LancamentoModel>> groupedPostings =
                    {};
                for (var posting in viewModel.ultimosLancamentos) {
                  String dataFormatada = formatarData(posting.date);
                  if (!groupedPostings.containsKey(dataFormatada)) {
                    groupedPostings[dataFormatada] = [];
                  }
                  groupedPostings[dataFormatada]!.add(posting);
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: groupedPostings.entries.map((entry) {
                    String data = entry.key;
                    List<LancamentoModel> postings = entry.value;

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
                              color: Color(0xFF2890CF),
                            ),
                          ),
                        ),
                        ...postings.map((posting) {
                          return ListTile(
                            onTap: () => mostrarDetalhesLancamento(context, posting),
                            leading:
                                SvgPicture.asset(posting.image, width: 30),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "R\$${formatarValor(posting.value)}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(posting.installments == 0 ? "" : "em ${posting.installments}x")
                              ],
                            ),
                            title: Text(
                              posting.description,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              formatarSubtitulo(posting.date),
                              style: TextStyle(fontSize: 14),
                            ),
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
