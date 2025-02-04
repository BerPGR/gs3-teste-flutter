import 'package:flutter/material.dart';
import 'package:gs3/app/shared/widget/cartao.dart';
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
                  return Cartao(cartao: cartao);
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
