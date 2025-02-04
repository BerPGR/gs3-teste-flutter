import 'package:flutter/material.dart';
import 'package:gs3/app/model/cartao_model.dart';

class HomeViewModel extends ChangeNotifier {
  final List<CartaoModel> _cartoes = [
    CartaoModel(id: 0,
        number: "1111 2222", owner: "GS3 TECH", limit: 1200.50, bestDay: 20, cardColor: [Color(0xFF2B66BC), Color(0xFF132D55)]),
    CartaoModel(id: 1,
        number: "3333 4444", owner: "Jane Doe", limit: 1200.50, bestDay: 20, cardColor: [Color(0xFF017375), Color(0xFF005153)]),
    CartaoModel(id: 2,
        number: "5555 6666", owner: "John Doe", limit: 1200.50, bestDay: 20, cardColor: [Color(0xFF8f07bc), Color(0xFF720099)]),
  ];

  final ValueNotifier<CartaoModel?> cartaoSelecionado =
      ValueNotifier<CartaoModel?>(null);

  HomeViewModel() {
    cartaoSelecionado.value = _cartoes.first;
  }

  List<CartaoModel> get cartoes => _cartoes;

  void selectCard(int index) {
    cartaoSelecionado.value = cartoes[index];
    notifyListeners();
  }
}
