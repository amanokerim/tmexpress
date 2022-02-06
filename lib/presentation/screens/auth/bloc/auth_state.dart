part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState(this.code);
  final int? code;

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial(int code) : super(code);
}

class AuthWaitVerification extends AuthState {
  const AuthWaitVerification() : super(null);
}

class AuthVerificationSuccess extends AuthState {
  const AuthVerificationSuccess() : super(null);
}

class AuthError extends AuthState {
  const AuthError(this.message, this.code) : super(code);
  final String message;
  final int code;

  @override
  List<Object> get props => [message, code];
}
