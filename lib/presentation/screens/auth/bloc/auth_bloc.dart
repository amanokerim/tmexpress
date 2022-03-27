// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:math' show Random;

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/usecases/profile/auth_usecase.dart';
import '../../../bloc/app_bloc.dart';
import '../../../utils/constants.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends AppBloc<AuthEvent, AuthState> {
  AuthBloc(this._authUseCase) : super(const AuthInitial(0)) {
    on<AuthStarted>((event, emit) {
      code = _generateCode();
      emit(AuthInitial(code));
    });

    on<AuthVerificationStarted>((event, emit) async {
      phone = '+993${event.phone}'.replaceAll(' ', '');

      // Navigate to SMS app
      final sent = await _sms(code);
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(sent
          ? const AuthWaitVerification()
          : AuthError(S.current.cantNavigateToSMSApp, code));

      attempts = 0;
      add(AuthCheckRequested());
    });

    on<AuthCheckRequested>((event, emit) async {
      // TODO Change to real code and referral user
      final r = await _authUseCase(AuthParams(phone, 666666));
      final st = r.fold((l) => null, (r) => const AuthVerificationSuccess());
      if (st != null) {
        emit(st);
      } else {
        await Future<void>.delayed(const Duration(seconds: 3));
        if (++attempts < 40) {
          add(AuthCheckRequested());
        } else {
          emit(AuthError(S.current.canNotVerify, code));
        }
      }
    });

    on<AuthVerificationCanceled>((event, emit) {
      attempts = 50;
      emit(AuthInitial(code));
    });
  }

  final AuthUseCase _authUseCase;

  late int code;
  late String phone;
  int attempts = 0;

  int _generateCode() => 100000 + Random().nextInt(899999);

  Future<bool> _sms(int code) async {
    // Android
    var uri = 'sms:$kVerificationPhone?body=$code';
    if (await canLaunch(uri)) return launch(uri);
    // iOS
    uri = 'sms:$kVerificationPhone?body=$code';
    if (await canLaunch(uri)) return launch(uri);
    return false;
  }
}
