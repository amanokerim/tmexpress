import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/local/keys.dart';
import '../../../../domain/entities/interface/fcm_notification.dart';
import '../../../../domain/usecases/get_fcm_stream_usecase.dart';
import '../../../../domain/usecases/preferences/get_bool_preference_usecase.dart';
import '../../../../domain/usecases/preferences/get_string_preference_usecase.dart';
import '../../../../domain/usecases/preferences/set_preference_usecase.dart';
import '../../../bloc/app_bloc.dart';

part 'start_event.dart';
part 'start_state.dart';

@injectable
class StartBloc extends AppBloc<StartEvent, StartState> {
  StartBloc(
    this._getBoolPreferenceUseCase,
    this._getStringPreferenceUseCase,
    this._setPreferenceUseCase,
    this._getFCMStreamUseCase,
  ) : super(StartInitial()) {
    on<StartInitialized>((event, emit) async {
      // TODO uncomment
      // final firstOpen = (await _getBoolPreferenceUseCase(pFirstOpen))
      //     .fold((_) => false, (r) => r ?? true);
      // if (firstOpen) {
      //   yield StartShowOnboarding();
      //   return;
      // }
      emit(StartSetUpFCMListener(_getFCMStreamUseCase()));
      emit(const StartShowHome(tab: 0));
    });

    on<StartOnboardingComplete>((event, emit) async {
      await _setPreferenceUseCase(
          SetPreferenceParams(key: pFirstOpen, val: false));
      emit(const StartShowHome(tab: 0));
    });

    on<StartNavigatedToHome>(
      (event, emit) => emit(StartShowHome(tab: event.tab)),
    );

    on<StartAuthErrorOcurred>(
        (event, emit) => emit(const StartShowHome(tab: 4)));

    add(StartInitialized());
  }

  // ignore_for_file: unused_field
  final GetBoolPreferenceUseCase _getBoolPreferenceUseCase;
  final GetStringPreferenceUseCase _getStringPreferenceUseCase;
  final SetPreferenceUseCase _setPreferenceUseCase;
  final GetFCMStreamUseCase _getFCMStreamUseCase;
}
