import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tmexpress/presentation/widgets/app_button.dart';
import 'package:tmexpress/presentation/widgets/app_info.dart';

import '../../../app/generated/l10n.dart';
import '../../theme/app_theme.dart';

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
        TextField(
          inputFormatters: [MaskTextInputFormatter(mask: '## ######')],
          decoration: InputDecoration(
            label: Text(S.current.phone),
            prefix: const Text('+993 '),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
        const SizedBox(height: 16),
        const AppInfo(
            'Hasaba girmek üçin \n+993 64 921507 belgä "823764" SMS ugradyň.'),
        const SizedBox(height: 16),
        AppButton(
          label: 'Ugratmak',
          onPressed: () {},
          type: ButtonType.black,
        ),
      ],
    );
  }
}
