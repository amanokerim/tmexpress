import '../image.dart';
import '../product/product_mini.dart';
import '../product/size.dart';

class PlacedOrderItem {
  const PlacedOrderItem({
    required this.product,
    required this.qty,
    required this.size,
    required this.color,
  });

  final ProductMini product;
  final int qty;
  final Size size;
  final Image color;
}
