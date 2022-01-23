import 'product_mini.dart';
import 'product_parent.dart';

class Tag extends ProductParent {
  const Tag({
    required this.id,
    required this.title,
    required this.product,
  }) : super(id, title);
  final int id;
  final String title;
  final List<ProductMini> product;
}
