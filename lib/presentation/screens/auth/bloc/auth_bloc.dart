// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:math' show Random;

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/generated/l10n.dart';
import '../../../bloc/app_bloc.dart';
import '../../../utils/constants.dart';

part 'auth_state.dart';
part 'auth_event.dart';

@injectable
class AuthBloc extends AppBloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial(0)) {
    on<AuthStarted>((event, emit) {
      code = _generateCode();
      emit(AuthInitial(code));
    });

    on<AuthVerificationStarted>((event, emit) async {
      // Navigate to SMS app
      final sent = await _sms(code);
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(sent
          ? const AuthWaitVerification()
          : AuthError(S.current.cantNavigateToSMSApp, code));
    });

    on<AuthVerificationCanceled>((event, emit) {
      emit(AuthInitial(code));
    });
  }

  late int code;

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
