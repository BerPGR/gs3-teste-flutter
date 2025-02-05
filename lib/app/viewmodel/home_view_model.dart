import 'package:flutter/material.dart';
import 'package:gs3/app/model/cartao_model.dart';
import 'package:gs3/app/model/lancamento_model.dart';

class HomeViewModel extends ChangeNotifier {
  final List<CartaoModel> _cartoes = [
    CartaoModel(
        id: 0,
        number: "1111 2222",
        owner: "GS3 TECH",
        limit: 7867.80,
        bestDay: 12,
        postings: [
          LancamentoModel(
            installments: 0,
            image: "assets/images/shop.svg",
              description: "Mercado",
              value: 89.23,
              date: DateTime(2025, 2, 5, 8, 42)),
          LancamentoModel(
            installments: 0,
            image: "assets/images/motion.svg",
              description: "Gasolina",
              value: 60.00,
              date: DateTime(2025, 2, 3, 07, 34)),
          LancamentoModel(
            installments: 0,
            image: "assets/images/shop.svg",
              description: "Restaurante",
              value: 80.50,
              date: DateTime(2025, 2, 3, 12, 34)),
          LancamentoModel(
            installments: 0,
            image: "assets/images/shop.svg",
              description: "Farmácia",
              value: 7.85,
              date: DateTime(2025, 1, 27, 8, 12)),
          LancamentoModel(
            installments: 0,
            image: "assets/images/leisure.svg",
              description: "Netflix",
              value: 39.90,
              date: DateTime(2025, 1, 27, 10)),
          LancamentoModel(
            installments: 0,
            image: "assets/images/motion.svg",
              description: "Uber",
              value: 12.97,
              date: DateTime(2025, 1, 23, 9)),
        ],
        cardColor: [
          Color(0xFF2B66BC),
          Color(0xFF132D55)
        ]),
    CartaoModel(
        id: 1,
        number: "3333 4444",
        owner: "Jane Doe",
        limit: 2341.27,
        bestDay: 20,
                postings: [
          LancamentoModel(
            installments: 12,
            image: "assets/images/study.svg",
              description: "Curso Inglês",
              value: 899.90,
              date: DateTime(2025, 2, 1, 9)),
          LancamentoModel(
            installments: 0,
            image: "assets/images/leisure.svg",
              description: "Crunchyroll",
              value: 29.90,
              date: DateTime(2025, 1, 23, 12, 34)),
          LancamentoModel(
            installments: 0,
            image: "assets/images/motion.svg",
              description: "BRB",
              value: 3.80,
              date: DateTime(2025, 1, 13, 07, 34)),
          LancamentoModel(
            installments: 2,
            image: "assets/images/shop.svg",
              description: "Zé Padoca's",
              value: 13.47,
              date: DateTime(2024, 12, 24, 14, 20)),
          LancamentoModel(
            installments: 6,
            image: "assets/images/tech.svg",
              description: "Apple",
              value: 27.00,
              date: DateTime(2024, 12, 3, 12, 34)),
          LancamentoModel(
            installments: 0,
            image: "assets/images/shop.svg",
              description: "CanelaCafe",
              value: 25.00,
              date: DateTime(2024, 12, 3, 12, 34)),
        ],
        cardColor: [Color(0xFF017375), Color(0xFF005153)]),
    CartaoModel(
        id: 2,
        number: "5555 6666",
        owner: "John Doe",
        limit: 829.00,
        bestDay: 4,
                postings: [
          LancamentoModel(
            installments: 10,
            image: "assets/images/study.svg",
              description: "Curso Java",
              value: 150.75,
              date: DateTime(2024, 2, 5, 2, 12)),
          LancamentoModel(
            installments: 8,
            image: "assets/images/tech.svg",
              description: "Pichau*Informatica",
              value: 200.00,
              date: DateTime(2025, 2, 1, 17, 00)),
          LancamentoModel(
            installments: 0,
            image: "assets/images/leisure.svg",
              description: "Steam Game",
              value: 80.50,
              date: DateTime(2025, 2, 1, 13, 50)),
          LancamentoModel(
            installments: 5,
            image: "assets/images/tech.svg",
              description: "Teclado Kabum",
              value: 500.00,
              date: DateTime(2025, 1, 23, 16, 48)),
          LancamentoModel(
            installments: 0,
            image: "assets/images/leisure.svg",
              description: "Streaming",
              value: 39.90,
              date: DateTime(2025, 1, 5, 12, 34)),
          LancamentoModel(
            installments: 0,
            image: "assets/images/motion.svg",
              description: "Uber",
              value: 25.00,
              date: DateTime(2025, 1, 5, 09, 12)),
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
    return cartao.postings.take(5).toList();
  }
}
