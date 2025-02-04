import 'package:flutter/material.dart';

class CartaoModel {
  final int id;
  final String number;
  final String owner;
  final double limit;
  final int bestDay;
  final List<Color> cardColor;

  CartaoModel({
    required this.id,
    required this.number,
    required this.owner,
    required this.limit,
    required this.bestDay,
    required this.cardColor
  });
}