import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../widgets/app_button.dart';
import '../bloc/auth_bloc.dart';

class AuthCodeForm extends StatefulWidget {
  const AuthCodeForm(this.state, {super.key});
  final AuthState state;

  @override
  State<AuthCodeForm> createState() => _AuthCodeFormState();
}

class _AuthCodeFormState extends State<AuthCodeForm> {
  late TextEditingController _codeC;

  @override
  void initState() {
    super.initState();
    _codeC = TextEditingController();
  }

  @override
  void dispose() {
    _codeC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _codeC,
          onFieldSubmitted: (_) => _submit(),
          keyboardType: TextInputType.phone,
          maxLength: 5,
          decoration: InputDecoration(
            label: Text(S.current.code),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            counter: const SizedBox(),
          ),
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: _codeC,
          builder: (_, code, __) {
            return AppButton(
              label: S.current.login,
              onPressed: code.text.length == 5 ? _submit : null,
              type: ButtonType.black,
            );
          },
        ),
      ],
    );
  }

  void _submit() {
    context.read<AuthBloc>().add(AuthSignInWithSMS(code: _codeC.text));
  }
}
