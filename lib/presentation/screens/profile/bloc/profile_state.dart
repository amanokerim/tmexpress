part of 'profile_bloc.dart';

enum ProfileLoad { none, share }

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoadInProgress extends ProfileState {}

class ProfileNotAuthorized extends ProfileState {}

class ProfileLoadSuccess extends ProfileState {
  const ProfileLoadSuccess(this.profile, {this.profileLoad = ProfileLoad.none});
  final Profile profile;
  final ProfileLoad profileLoad;

  @override
  List<Object> get props => [profile, profileLoad];
}

class ProfileLoadError extends ProfileState {
  const ProfileLoadError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
