import 'dart:convert';

import 'order_item.dart';

class Order {
  const Order({
    required this.orderitems,
    required this.isExpress,
  });

  final List<OrderItem> orderitems;
  final bool isExpress;
  // TODO insert referralId

  Map<String, dynamic> toJson() {
    return {
      'orderitems': orderitems.map((x) => x.toJson()).toList(),
      'isExpress': isExpress,
    };
  }
}
