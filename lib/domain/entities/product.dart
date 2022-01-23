import 'package:equatable/equatable.dart';

import 'image.dart';
import 'size.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.weight,
    required this.ourRating,
    required this.discount,
    required this.productImages,
    required this.size,
    required this.expressPrice,
    required this.normalPrice,
    required this.expressPriceW,
    required this.normalPriceW,
    required this.wholesaleLimit,
  });

  final int id;
  final String title;
  final String description;
  final double weight;
  final double ourRating;
  final double discount;
  final List<Image> productImages;
  final List<Size> size;
  final double expressPrice;
  final double normalPrice;
  final double expressPriceW;
  final double normalPriceW;
  final int wholesaleLimit;

  @override
  List<Object?> get props => [id];
}
