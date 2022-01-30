import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../bloc/app_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends AppBloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
  }
}
