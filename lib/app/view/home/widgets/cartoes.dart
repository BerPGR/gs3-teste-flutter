import 'package:flutter/material.dart';
import 'package:gs3/app/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Cartoes extends StatefulWidget {
  const Cartoes({super.key});

  @override
  State<Cartoes> createState() => _CartoesState();
}

class _CartoesState extends State<Cartoes> {
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<HomeViewModel>(context, listen: false).cartaoSelecionado;
    final pageController = PageController(initialPage: provider.value!.id);
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          spacing: 8,
          children: [
            SizedBox(
              height: 160,
              child: PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) => viewModel.selectCard(index),
                children: viewModel.cartoes.map((cartao) {
                  return Container(
                      padding: const EdgeInsets.all(13),
                      width: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            cartao.cardColor[0],
                            cartao.cardColor[1],
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            spacing: 16,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.grey.shade400,
                                height: 66,
                                width: 98,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartao.number,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      cartao.owner,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: Color(0xFF3C6AB2),
                              )
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Limite disponível",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                  Text(
                                    "R\$${cartao.limit.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Melhor dia de compra",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                  Text(
                                    cartao.bestDay.toString(),
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ));
                }).toList(),
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: viewModel.cartoes.length,
              effect: ExpandingDotsEffect(
                  activeDotColor: Color(0xFF3C6AB2), dotHeight: 8, dotWidth: 8),
            )
          ],
        );
      },
    );
  }
}
