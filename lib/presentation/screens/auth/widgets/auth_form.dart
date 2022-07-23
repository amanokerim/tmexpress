import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../app/generated/l10n.dart';
import '../../../utils/app_validator.dart';
import '../../../utils/constants.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_info_card.dart';
import '../bloc/auth_bloc.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.state, {Key? key}) : super(key: key);

  final AuthState state;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
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
    return Column(
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            controller: _phoneController,
            validator: AppValidator.phone,
            onFieldSubmitted: (_) => _submit(),
            inputFormatters: [MaskTextInputFormatter(mask: '## ######')],
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              label: Text(S.current.phone),
              prefix: const Text('+993 '),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ),
        const SizedBox(height: 16),
        AppInfoCard(S.current
            .sendSmsExplanation(kVerificationPhone, widget.state.code!)),
        const SizedBox(height: 16),
        AppButton(
            label: S.current.sendSms,
            onPressed: _submit,
            type: ButtonType.black),
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
