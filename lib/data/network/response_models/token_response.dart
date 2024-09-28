import 'package:json_annotation/json_annotation.dart';
part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse {
  const TokenResponse({
    this.refresh,
    this.accessToken,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);

  final String? refresh;
  @JsonKey(name: 'access_token')
  final String? accessToken;
}
