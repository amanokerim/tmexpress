import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_error.dart';
import '../bloc/profile_bloc.dart';

class ProfileError extends StatelessWidget {
  const ProfileError(this.message, {Key? key}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AppErrorScreen(
            message: message,
            onPressed: () => context.read<ProfileBloc>().add(ProfileStarted()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: AppButton(
            label: S.current.logOut,
            type: ButtonType.black,
            onPressed: () =>
                context.read<ProfileBloc>().add(ProfileSignOutRequested()),
          ),
        )
      ],
    );
  }
}
