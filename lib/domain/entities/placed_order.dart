class PlacedOrder {
  const PlacedOrder({
    required this.id,
    required this.user,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int user;
  final String status;
  final double totalPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
}
