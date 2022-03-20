import 'interface/order_status.dart';

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
  final OrderStatus status;
  final double totalPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
}
