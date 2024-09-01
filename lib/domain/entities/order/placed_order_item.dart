import '../image.dart';
import '../product/product_mini.dart';
import '../product/size.dart';
import 'order_status.dart';

class PlacedOrderItem {
  const PlacedOrderItem({
    required this.product,
    required this.qty,
    required this.size,
    required this.color,
    required this.price,
    required this.status,
  });

  final ProductMini product;
  final int qty;
  final Size size;
  final Image color;
  final double price;
  final OrderStatus status;
}
