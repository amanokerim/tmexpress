import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_error.dart';
import '../../widgets/app_progress_indicator.dart';
import '../auth/auth_page.dart';
import 'bloc/profile_bloc.dart';
import 'profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (_, state) {
      if (state is ProfileNotAuthorized) {
        return const AuthPage();
      } else if (state is ProfileLoadSuccess) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ProfileCard(state.profile),
          ],
        );
      } else if (state is ProfileLoadError) {
        return AppError(
            message: state.message,
            onPressed: () => context.read<ProfileBloc>().add(ProfileStarted()));
      }
      return const AppProgressIndicator();
    });
  }
}
