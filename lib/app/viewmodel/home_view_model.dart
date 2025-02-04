import 'package:flutter/material.dart';
import 'package:gs3/app/model/cartao_model.dart';

class HomeViewModel extends ChangeNotifier {
  final List<CartaoModel> _cartoes = [
    CartaoModel(
        number: "1111 2222", owner: "Cartão 1", limit: 1200.50, bestDay: 20),
    CartaoModel(
        number: "3333 4444", owner: "Cartão 2", limit: 1200.50, bestDay: 20),
    CartaoModel(
        number: "5555 6666", owner: "Cartão 3", limit: 1200.50, bestDay: 20),
  ];

  final ValueNotifier<CartaoModel?> cartaoSelecionado =
      ValueNotifier<CartaoModel?>(null);

  HomeViewModel() {
    cartaoSelecionado.value = _cartoes.first;
  }

  List<CartaoModel> get cartoes => _cartoes;
}
