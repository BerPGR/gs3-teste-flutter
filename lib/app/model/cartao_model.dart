class CartaoModel {
  final String number;
  final String owner;
  final double limit;
  final int bestDay;

  CartaoModel({
    required this.number,
    required this.owner,
    required this.limit,
    required this.bestDay
  });
}