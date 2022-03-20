// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placed_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacedOrderResponse _$PlacedOrderResponseFromJson(Map<String, dynamic> json) =>
    PlacedOrderResponse(
      id: json['id'] as int?,
      user: json['user'] as int?,
      status: json['status'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$PlacedOrderResponseToJson(
        PlacedOrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'status': instance.status,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
