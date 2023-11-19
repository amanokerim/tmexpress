import 'package:equatable/equatable.dart';

import '../image.dart';
import 'size.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.video,
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
    required this.isLiked,
  });

  final int id;
  final String title;
  final String description;
  final String video;
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
  final bool isLiked;

  double normalPriceByCount(int count) =>
      count >= wholesaleLimit ? normalPriceW : normalPrice;
  double expressPriceByCount(int count) =>
      count >= wholesaleLimit ? expressPriceW : expressPrice;

  @override
  List<Object?> get props => [id, isLiked];

  Product copyWith({
    int? id,
    String? title,
    String? description,
    double? weight,
    double? ourRating,
    double? discount,
    List<Image>? productImages,
    List<Size>? size,
    double? expressPrice,
    double? normalPrice,
    double? expressPriceW,
    double? normalPriceW,
    int? wholesaleLimit,
    bool? isLiked,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      video: video,
      weight: weight ?? this.weight,
      ourRating: ourRating ?? this.ourRating,
      discount: discount ?? this.discount,
      productImages: productImages ?? this.productImages,
      size: size ?? this.size,
      expressPrice: expressPrice ?? this.expressPrice,
      normalPrice: normalPrice ?? this.normalPrice,
      expressPriceW: expressPriceW ?? this.expressPriceW,
      normalPriceW: normalPriceW ?? this.normalPriceW,
      wholesaleLimit: wholesaleLimit ?? this.wholesaleLimit,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
