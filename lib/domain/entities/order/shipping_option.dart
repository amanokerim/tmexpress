import 'package:equatable/equatable.dart';

class ShippingOption extends Equatable {
  const ShippingOption({
    required this.title,
    required this.duration,
    required this.priceUnit,
    required this.price,
    required this.image,
  });

  final String title;
  final String duration;
  final String priceUnit;
  final double price;
  final String image;

  @override
  List<Object?> get props => [title, duration, price, image];
}
