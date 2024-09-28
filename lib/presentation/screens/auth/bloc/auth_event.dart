part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {}

class AuthSMSSignInStarted extends AuthEvent {
  AuthSMSSignInStarted({
    required this.phone,
  });
  final String phone;

  @override
  List<Object?> get props => [phone];
}

class AuthSignInWithSMS extends AuthEvent {
  AuthSignInWithSMS({
    required this.code,
  });
  final String code;

  @override
  List<Object?> get props => [code];
}

class AuthVerificationCanceled extends AuthEvent {}
