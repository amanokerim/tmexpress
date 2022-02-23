import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/auth_page.dart';
import 'bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (_, state) {
      if (state is ProfileNotAuthorized) return const AuthPage();

      return Text(state.toString());
    });
  }
}
