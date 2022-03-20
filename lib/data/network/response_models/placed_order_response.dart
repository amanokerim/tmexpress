import 'package:json_annotation/json_annotation.dart';

part 'placed_order_response.g.dart';

@JsonSerializable()
class PlacedOrderResponse {
  const PlacedOrderResponse({
    this.id,
    this.user,
    this.status,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
  });

  factory PlacedOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$PlacedOrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlacedOrderResponseToJson(this);

  final int? id;
  final int? user;
  final String? status;
  final double? totalPrice;
  final String? createdAt;
  final String? updatedAt;
}
