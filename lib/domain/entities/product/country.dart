import 'package:json_annotation/json_annotation.dart';

import '../../../main.dart';
import '../../../presentation/utils/string_extension.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  Country({
    required this.id,
    required this.titleTm,
    required this.titleRu,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);

  final int id;

  @JsonKey(name: 'title', defaultValue: '')
  final String titleTm;

  @JsonKey(name: 'title_ru')
  final String? titleRu;

  String get title => (isRu ? titleRu : null) ?? titleTm;

  @JsonKey(fromJson: imageFromJson)
  final String flag;
}
