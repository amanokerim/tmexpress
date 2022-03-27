import 'order_item.dart';

class Order {
  const Order({
    required this.orderitems,
    required this.isExpress,
  });

  final List<OrderItem> orderitems;
  final bool isExpress;

  Map<String, dynamic> toJson() => {
        'orderitems': orderitems.map((x) => x.toJson()).toList(),
        'isExpress': isExpress,
      };
}
