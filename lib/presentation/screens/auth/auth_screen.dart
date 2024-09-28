import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../app/generated/l10n.dart';
import '../../theme/app_theme.dart';
import '../../utils/app_flash.dart';
import '../profile/bloc/profile_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'widgets/auth_code_form.dart';
import 'widgets/auth_phone_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ListView(
      padding: const EdgeInsets.all(30),
      reverse: true,
      children: [
        LottieBuilder.asset(
          'assets/animations/auth.json',
          height: w * .8,
          repeat: false,
        ),
        const SizedBox(height: 28),
        Text(S.current.login, style: AppTextStyle.bold26),
        const SizedBox(height: 16),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (_, state) {
            if (state is AuthError) {
              AppFlash.toast(
                context: context,
                isError: true,
                message: state.message == S.current.forbidden
                    ? S.current.wrongCode
                    : state.message,
              );
            } else if (state is AuthSuccess) {
              // add event for fetching profile
              context.read<ProfileBloc>().add(ProfileStarted());
            }
          },
          builder: (context, state) {
            if (state is AuthError || state is AuthInitial) {
              return AuthPhoneForm(state);
            } else if (state is AuthEnterCode) {
              return AuthCodeForm(state);
            }
            return const SizedBox();
          },
        ),
      ].reversed.toList(),
    );
  }
}
