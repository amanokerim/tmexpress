part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthEnterCode extends AuthState {
  const AuthEnterCode();
}

class AuthSuccess extends AuthState {
  const AuthSuccess();
}

class AuthError extends AuthState {
  const AuthError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
