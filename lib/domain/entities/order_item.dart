import 'dart:convert';

class OrderItem {
  const OrderItem({
    required this.product,
    required this.qty,
    required this.size,
    required this.color,
  });

  final int product;
  final int qty;
  final int size;
  final int color;

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'qty': qty,
      'size': size,
      'color': color,
    };
  }
}
