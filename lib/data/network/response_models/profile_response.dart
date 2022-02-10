import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  const ProfileResponse({
    this.name,
    this.gender,
    this.region,
    this.address,
    this.username,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

  final String? name;
  final String? gender;
  final String? region;
  final String? address;
  final int? username;
}
