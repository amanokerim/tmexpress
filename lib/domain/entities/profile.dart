class Profile {
  Profile({
    required this.phone,
    this.name,
    this.gender,
    this.region,
    this.address,
  });

  final String phone;
  final String? name;
  final String? gender;
  final String? region;
  final String? address;
}
