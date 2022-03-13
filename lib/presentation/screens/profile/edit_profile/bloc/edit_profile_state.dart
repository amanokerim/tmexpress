part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  const EditProfileState(
      this.gender, this.region, this.loadState, this.message);
  final Gender? gender;
  final Region? region;
  final LoadState loadState;
  final String? message;

  @override
  List<Object?> get props => [gender, region, loadState, message];
}
