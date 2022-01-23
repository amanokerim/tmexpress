import 'package:equatable/equatable.dart';

import 'image.dart';
import 'product.dart';
import 'size.dart';

class CartItem extends Equatable {
  const CartItem({
    required this.product,
    required this.count,
    required this.size,
    required this.color,
  });

  final Product product;
  final int count;
  final Size size;
  final Image color;

  @override
  List<Object?> get props => [product, size, color];

  CartItem increase(int count) => CartItem(
        product: product,
        count: this.count + count,
        size: size,
        color: color,
      );

  CartItem copyWith({
    Product? product,
    int? count,
    Size? size,
    Image? color,
  }) =>
      CartItem(
        product: product ?? this.product,
        count: count ?? this.count,
        size: size ?? this.size,
        color: color ?? this.color,
      );
}
