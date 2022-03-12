// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      name: json['name'] as String?,
      gender: json['gender'] as int?,
      region: json['region'] as int?,
      address: json['address'] as String?,
      username: json['username'] as String?,
      referalEarning: (json['referalEarning'] as num?)?.toDouble(),
      referalUserCount: json['referalUserCount'] as int?,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'region': instance.region,
      'address': instance.address,
      'username': instance.username,
      'referalUserCount': instance.referalUserCount,
      'referalEarning': instance.referalEarning,
    };
