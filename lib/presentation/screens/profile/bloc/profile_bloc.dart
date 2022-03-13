import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/local/keys.dart';
import '../../../../domain/entities/profile.dart';
import '../../../../domain/usecases/preferences/get_string_preference_usecase.dart';
import '../../../../domain/usecases/profile/fetch_profile_usecase.dart';
import '../../../bloc/app_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends AppBloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._getStringPreferenceUseCase, this._fetchProfileUseCase)
      : super(ProfileLoadInProgress()) {
    on<ProfileStarted>((event, emit) async {
      final jwtR = await _getStringPreferenceUseCase(pJWT);
      final jwt = jwtR.fold((l) => null, (r) => r);

      emit(ProfileLoadInProgress());
      if (jwt == null) {
        emit(ProfileNotAuthorized());
      } else {
        final r = await _fetchProfileUseCase();
        emit(r.fold(
          (failure) => ProfileLoadError(message: mapError(failure)),
          (profile) => ProfileLoadSuccess(profile),
        ));
      }
    });

    on<ProfileChanged>((event, emit) {
      emit(ProfileLoadSuccess(event.profile));
    });
  }

  final GetStringPreferenceUseCase _getStringPreferenceUseCase;
  final FetchProfileUseCase _fetchProfileUseCase;
}
