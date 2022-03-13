part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileStarted extends ProfileEvent {}

class ProfileChanged extends ProfileEvent {
  const ProfileChanged(this.profile);
  final Profile profile;

  @override
  List<Object> get props => [profile];
}
