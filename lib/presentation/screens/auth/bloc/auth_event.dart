part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class AuthVerificationStarted extends AuthEvent {
  AuthVerificationStarted({
    required this.phone,
  });
  final String phone;

  @override
  List<Object?> get props => [phone];
}

class AuthVerificationCanceled extends AuthEvent {}
