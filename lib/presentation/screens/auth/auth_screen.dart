import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../app/generated/l10n.dart';
import '../../theme/app_theme.dart';
import '../../utils/app_flash.dart';
import '../../utils/app_validator.dart';
import '../../utils/constants.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_info.dart';
import '../../widgets/app_progress_indicator.dart';
import '../profile/bloc/profile_bloc.dart';
import 'bloc/auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

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
              return Column(
                children: [
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _phoneController,
                      validator: AppValidator.phone,
                      onFieldSubmitted: (_) => _submit(),
                      inputFormatters: [
                        MaskTextInputFormatter(mask: '## ######')
                      ],
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        label: Text(S.current.phone),
                        prefix: const Text('+993 '),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppInfo(S.current
                      .sendSmsExplanation(kVerificationPhone, state.code!)),
                  const SizedBox(height: 16),
                  AppButton(
                    label: S.current.sendSms,
                    onPressed: _submit,
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
            return const SizedBox();
          },
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context
          .read<AuthBloc>()
          .add(AuthVerificationStarted(phone: _phoneController.text));
    }
  }
}
