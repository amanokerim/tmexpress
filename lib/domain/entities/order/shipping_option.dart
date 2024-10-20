// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ShippingOption extends Equatable {
  const ShippingOption({
    required this.id,
    required this.title,
    required this.duration,
    required this.priceUnit,
    required this.price,
    required this.image,
  });

  final int id;
  final String title;
  final String duration;
  final String priceUnit;
  final double price;
  final String image;

  @override
  List<Object?> get props => [title, duration, price, image];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'duration': duration,
      'priceUnit': priceUnit,
      'price': price,
      'image': image,
    };
  }

  factory ShippingOption.fromMap(Map<String, dynamic> map) {
    return ShippingOption(
      id: map['id'] as int,
      title: map['title'] as String,
      duration: map['duration'] as String,
      priceUnit: map['priceUnit'] as String,
      price: map['price'] as double,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShippingOption.fromJson(String source) =>
      ShippingOption.fromMap(json.decode(source) as Map<String, dynamic>);
}
