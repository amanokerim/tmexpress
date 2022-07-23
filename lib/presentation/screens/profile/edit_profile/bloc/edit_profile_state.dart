part of 'edit_profile_bloc.dart';

class EditProfileState {
  const EditProfileState(this.gender, this.region, this.loadState, this.error);
  final Gender? gender;
  final Region? region;
  final LoadState loadState;
  final AppError? error;
}
