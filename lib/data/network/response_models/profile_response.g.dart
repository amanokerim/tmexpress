// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      name: json['name'] as String?,
      gender: json['gender'] as bool?,
      region: json['region'] as String?,
      address: json['address'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'region': instance.region,
      'address': instance.address,
      'username': instance.username,
    };
