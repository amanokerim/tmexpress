import 'country.dart';

class ProductMini {
  ProductMini({
    required this.id,
    required this.title,
    required this.ourRating,
    required this.discount,
    required this.normalPrice,
    required this.imageMini,
    required this.country,
  });

  final int id;
  final String title;
  final double ourRating;
  final int discount;
  final double normalPrice;
  final String imageMini;
  final Country? country;
}
