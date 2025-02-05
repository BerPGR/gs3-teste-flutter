import 'package:flutter/material.dart';
import 'package:gs3/app/model/lancamento_model.dart';

class CartaoModel {
  final int id;
  final String number;
  final String owner;
  final double limit;
  final int bestDay;
  final List<LancamentoModel> postings;
  final List<Color> cardColor;

  CartaoModel({
    required this.id,
    required this.number,
    required this.owner,
    required this.limit,
    required this.bestDay,
    required this.postings,
    required this.cardColor
  });
}