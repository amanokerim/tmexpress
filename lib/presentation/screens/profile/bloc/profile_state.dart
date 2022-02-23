part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoadInProgress extends ProfileState {}

class ProfileNotAuthorized extends ProfileState {}

class ProfileLoadSuccess extends ProfileState {
  const ProfileLoadSuccess(this.profile);
  final Profile profile;
}

class ProfileLoadError extends ProfileState {
  const ProfileLoadError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
