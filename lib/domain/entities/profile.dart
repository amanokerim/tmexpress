import 'enums/gender.dart';
import 'enums/region.dart';

class Profile {
  Profile(
      {required this.phone,
      required this.referalUserCount,
      required this.referalEarning,
      this.name,
      this.gender,
      this.region,
      this.address});

  final String phone;
  final String? name;
  final Gender? gender;
  final Region? region;
  final String? address;
  final int referalUserCount;
  final double referalEarning;
}
