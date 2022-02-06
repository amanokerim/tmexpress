import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../app/generated/l10n.dart';
import '../../theme/app_theme.dart';
import '../../utils/app_flash.dart';
import '../../utils/constants.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_info.dart';
import '../../widgets/app_progress_indicator.dart';
import 'bloc/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ListView(
      padding: const EdgeInsets.all(30),
      children: [
        LottieBuilder.asset(
          'assets/animations/auth.json',
          height: w * .7,
        ),
        const SizedBox(height: 28),
        Text(S.current.login, style: AppTextStyle.bold26),
        const SizedBox(height: 16),
        BlocConsumer<AuthBloc, AuthState>(
          listenWhen: (_, state) => state is AuthError,
          listener: (_, state) {
            AppFlash.toast(
                context: context, message: (state as AuthError).message);
          },
          builder: (context, state) {
            if (state is AuthError || state is AuthInitial) {
              return Column(
                children: [
                  TextField(
                    inputFormatters: [
                      MaskTextInputFormatter(mask: '## ######')
                    ],
                    decoration: InputDecoration(
                      label: Text(S.current.phone),
                      prefix: const Text('+993 '),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // TODO Meybe show phone and code bold with markup or html?
                  AppInfo(S.current
                      .sendSmsExpalanation(kVerificationPhone, state.code!)),
                  const SizedBox(height: 16),
                  AppButton(
                    label: S.current.sendSms,
                    onPressed: () =>
                        context.read<AuthBloc>().add(AuthVerificationStarted()),
                    type: ButtonType.black,
                  ),
                ],
              );
            } else if (state is AuthWaitVerification) {
              return Column(
                children: [
                  const AppProgressIndicator(size: 70),
                  Text(S.current.waitingVerificationText,
                      style: AppTextStyle.bold16),
                  const SizedBox(height: 16),
                  AppButton(
                      label: S.current.cancel,
                      onPressed: () => context
                          .read<AuthBloc>()
                          .add(AuthVerificationCanceled()),
                      type: ButtonType.outline),
                ],
              );
            }
            return Text(state.toString());
          },
        ),
      ],
    );
  }
}
