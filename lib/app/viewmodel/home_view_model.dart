import 'package:flutter/material.dart';
import 'package:gs3/app/model/cartao_model.dart';
import 'package:gs3/app/model/lancamento_model.dart';

class HomeViewModel extends ChangeNotifier {
  final List<CartaoModel> _cartoes = [
    CartaoModel(
        id: 0,
        number: "1111 2222",
        owner: "GS3 TECH",
        limit: 1200.50,
        bestDay: 20,
        lancamentos: [
          LancamentoModel(
            imagem: "assets/images/shop.svg",
              descricao: "Mercado",
              valor: 150.75,
              data: DateTime.now().subtract(Duration(days: 1))),
          LancamentoModel(
            imagem: "assets/images/motion.svg",
              descricao: "Gasolina",
              valor: 200.00,
              data: DateTime.now().subtract(Duration(days: 3))),
          LancamentoModel(
            imagem: "assets/images/shop.svg",
              descricao: "Restaurante",
              valor: 80.50,
              data: DateTime.now().subtract(Duration(days: 5))),
          LancamentoModel(
            imagem: "assets/images/shop.svg",
              descricao: "Farmácia",
              valor: 50.00,
              data: DateTime.now().subtract(Duration(days: 6))),
          LancamentoModel(
            imagem: "assets/images/leisure.svg",
              descricao: "Streaming",
              valor: 39.90,
              data: DateTime.now().subtract(Duration(days: 9))),
          LancamentoModel(
            imagem: "assets/images/motion.svg",
              descricao: "Uber",
              valor: 25.00,
              data: DateTime.now().subtract(Duration(days: 12))),
        ],
        cardColor: [
          Color(0xFF2B66BC),
          Color(0xFF132D55)
        ]),
    CartaoModel(
        id: 1,
        number: "3333 4444",
        owner: "Jane Doe",
        limit: 1200.50,
        bestDay: 20,
                lancamentos: [
          LancamentoModel(
            imagem: "assets/images/shop.svg",
              descricao: "Mercado",
              valor: 150.75,
              data: DateTime.now().subtract(Duration(days: 5))),
          LancamentoModel(
            imagem: "assets/images/motion.svg",
              descricao: "Gasolina",
              valor: 200.00,
              data: DateTime.now().subtract(Duration(days: 7))),
          LancamentoModel(
            imagem: "assets/images/shop.svg",
              descricao: "Restaurante",
              valor: 80.50,
              data: DateTime.now().subtract(Duration(days: 12))),
          LancamentoModel(
            imagem: "assets/images/shop.svg",
              descricao: "Farmácia",
              valor: 50.00,
              data: DateTime.now().subtract(Duration(days: 13))),
          LancamentoModel(
            imagem: "assets/images/leisure.svg",
              descricao: "Streaming",
              valor: 39.90,
              data: DateTime.now().subtract(Duration(days: 20))),
          LancamentoModel(
            imagem: "assets/images/motion.svg",
              descricao: "Uber",
              valor: 25.00,
              data: DateTime.now().subtract(Duration(days: 24))),
        ],
        cardColor: [Color(0xFF017375), Color(0xFF005153)]),
    CartaoModel(
        id: 2,
        number: "5555 6666",
        owner: "John Doe",
        limit: 1200.50,
        bestDay: 20,
                lancamentos: [
          LancamentoModel(
            imagem: "assets/images/study.svg",
              descricao: "Curso Udemy Java",
              valor: 150.75,
              data: DateTime.now().subtract(Duration(days: 4))),
          LancamentoModel(
            imagem: "assets/images/tech.svg",
              descricao: "Pichau*Informatica",
              valor: 200.00,
              data: DateTime.now().subtract(Duration(days: 3))),
          LancamentoModel(
            imagem: "assets/images/leisure.svg",
              descricao: "Steam Game",
              valor: 80.50,
              data: DateTime.now().subtract(Duration(days: 5))),
          LancamentoModel(
            imagem: "assets/images/tech.svg",
              descricao: "Teclado Kabum",
              valor: 50.00,
              data: DateTime.now().subtract(Duration(days: 6))),
          LancamentoModel(
            imagem: "assets/images/leisure.svg",
              descricao: "Streaming",
              valor: 39.90,
              data: DateTime.now().subtract(Duration(days: 9))),
          LancamentoModel(
            imagem: "assets/images/motion.svg",
              descricao: "Uber",
              valor: 25.00,
              data: DateTime.now().subtract(Duration(days: 12))),
        ],
        cardColor: [Color(0xFF8f07bc), Color(0xFF720099)]),
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

  List<LancamentoModel> get ultimosLancamentos {
    final cartao = cartaoSelecionado.value;
    if (cartao == null) return [];
    return cartao.lancamentos.take(5).toList();
  }
}
