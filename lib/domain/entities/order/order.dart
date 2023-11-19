import 'order_item.dart';

class Order {
  const Order({
    required this.orderitems,
    required this.shippingOption,
  });

  final List<OrderItem> orderitems;
  final int shippingOption;

  Map<String, dynamic> toJson() => {
        'orderitems': orderitems.map((x) => x.toJson()).toList(),
        'shipping_option_id': shippingOption,
      };
}
