import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_loader.dart';
import '../bloc/auth_bloc.dart';

class AuthWaitVerificationW extends StatelessWidget {
  const AuthWaitVerificationW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppLoader(size: 70),
        Text(S.current.waitingVerificationText, style: AppTextStyle.bold16),
        const SizedBox(height: 16),
        AppButton(
            label: S.current.cancel,
            onPressed: () =>
                context.read<AuthBloc>().add(AuthVerificationCanceled()),
            type: ButtonType.outline),
      ],
    );
  }
}
