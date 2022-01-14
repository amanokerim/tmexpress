import 'product_mini.dart';

class Tag {
  Tag({
    required this.id,
    required this.title,
    required this.product,
  });
  final int id;
  final String title;
  final List<ProductMini> product;
}
