// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      refresh: json['refresh'] as String?,
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access_token': instance.accessToken,
    };
