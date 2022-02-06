import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/injection/injection.dart';
import 'auth_screen.dart';
import 'bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt()..add(AuthStarted()),
      child: const AuthScreen(),
    );
  }
}
