import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../app/generated/l10n.dart';
import '../../theme/app_theme.dart';
import '../../utils/app_flash.dart';
import '../profile/bloc/profile_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'widgets/auth_form.dart';
import 'widgets/auth_wait_verification.w.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ListView(
      padding: const EdgeInsets.all(30),
      children: [
        LottieBuilder.asset('assets/animations/auth.json', height: w * .7),
        const SizedBox(height: 28),
        Text(S.current.login, style: AppTextStyle.bold26),
        const SizedBox(height: 16),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (_, state) {
            if (state is AuthError) {
              AppFlash.toast(context: context, message: state.message);
            } else if (state is AuthVerificationSuccess) {
              // add event for fetching profile
              context.read<ProfileBloc>().add(ProfileStarted());
            }
          },
          builder: (context, state) {
            if (state is AuthError || state is AuthInitial) {
              return AuthForm(state);
            } else if (state is AuthWaitVerification) {
              return const AuthWaitVerificationW();
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
