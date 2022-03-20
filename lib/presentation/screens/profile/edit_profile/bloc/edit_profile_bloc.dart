import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../app/generated/l10n.dart';
import '../../../../../domain/entities/enums/gender.dart';
import '../../../../../domain/entities/enums/load_state.dart';
import '../../../../../domain/entities/enums/region.dart';
import '../../../../../domain/entities/profile.dart';
import '../../../../../domain/usecases/profile/edit_profile_usecase.dart';
import '../../../../bloc/app_bloc.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

const _initialState = EditProfileState(null, null, LoadState.normal, null);

@injectable
class EditProfileBloc extends AppBloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this._editProfileUseCase) : super(_initialState) {
    on<EditProfileStarted>((event, emit) {
      _profile = event.profile;
      _gender = _profile.gender;
      _region = _profile.region;
      emit(_state());
    });

    on<EditProfileGenderChanged>((event, emit) {
      _gender = event.gender;
      emit(_state());
    });

    on<EditProfileRegionChanged>((event, emit) {
      _region = event.region;
      emit(_state());
    });

    on<EditProfileSubmitted>((event, emit) async {
      if (_region == null || _gender == null) {
        emit(_state(S.current.selectGenderAndRegion));
      } else {
        emit(_loading);
        final profile = _profile.copyWith(
            name: event.name,
            address: event.address,
            gender: _gender!,
            region: _region!);

        final r = await _editProfileUseCase(profile);
        emit(r.fold(
          (failure) => _state(message(failure)),
          (_) => _success,
        ));
      }
    });
  }

  EditProfileState _state([String? message]) =>
      EditProfileState(_gender, _region, LoadState.normal, message);
  EditProfileState get _loading =>
      EditProfileState(_gender, _region, LoadState.loading, null);
  EditProfileState get _success =>
      EditProfileState(_gender, _region, LoadState.success, null);

  late Profile _profile;
  Gender? _gender;
  Region? _region;

  final EditProfileUseCase _editProfileUseCase;
}
