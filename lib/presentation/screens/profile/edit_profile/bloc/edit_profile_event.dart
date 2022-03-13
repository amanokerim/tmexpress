part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object?> get props => [];
}

class EditProfileStarted extends EditProfileEvent {
  const EditProfileStarted(this.profile);
  final Profile profile;

  @override
  List<Object> get props => [profile];
}

class EditProfileSubmitted extends EditProfileEvent {
  const EditProfileSubmitted({
    required this.name,
    required this.address,
  });
  final String name;
  final String address;

  @override
  List<Object> get props => [name, address];
}

class EditProfileGenderChanged extends EditProfileEvent {
  const EditProfileGenderChanged(this.gender);
  final Gender? gender;

  @override
  List<Object?> get props => [gender];
}

class EditProfileRegionChanged extends EditProfileEvent {
  const EditProfileRegionChanged(this.region);
  final Region region;

  @override
  List<Object> get props => [region];
}
