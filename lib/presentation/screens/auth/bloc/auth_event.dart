part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthVerificationStarted extends AuthEvent {}

class AuthVerificationCanceled extends AuthEvent {}
