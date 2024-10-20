import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'image.dart';
import 'product/product.dart';
import 'product/size.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem extends Equatable {
  const CartItem({
    required this.product,
    required this.count,
    required this.size,
    required this.color,
    required this.price,
    required this.expressPrice,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  final Product product;
  final int count;
  final Size size;
  final Image color;
  // retail or whole sale price with normal delivery
  final double price;
  // retail or whole sale price with express delivery
  final double expressPrice;

  @override
  List<Object?> get props => [product, size, color];

  CartItem increase(int count) {
    final newCount = this.count + count;
    return CartItem(
      product: product,
      count: newCount,
      size: size,
      color: color,
      // control wholesale here
      price: newCount >= product.wholesaleLimit
          ? product.normalPriceW
          : product.normalPrice,
      expressPrice: newCount >= product.wholesaleLimit
          ? product.normalPriceW
          : product.normalPrice,
    );
  }

  CartItem copyWith({
    Product? product,
    int? count,
    Size? size,
    Image? color,
    double? price,
    double? expressPrice,
  }) =>
      CartItem(
        product: product ?? this.product,
        count: count ?? this.count,
        size: size ?? this.size,
        color: color ?? this.color,
        price: price ?? this.price,
        expressPrice: expressPrice ?? this.expressPrice,
      );
}
