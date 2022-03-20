import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_button.dart';
import '../bloc/cart_bloc.dart';

class ContinueOrderButton extends StatelessWidget {
  const ContinueOrderButton(this.total, {Key? key}) : super(key: key);
  final double total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: '${S.current.total}:\n',
              style: AppTextStyle.grey14,
              children: [
                TextSpan(
                  text: S.current.nMan(total),
                  style: AppTextStyle.bold16.copyWith(height: 1.3),
                )
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AppButton(
              label: S.current.continueButton,
              type: ButtonType.black,
              onPressed: () => context.read<CartBloc>().add(CartOrderPlaced()),
            ),
          ),
        ],
      ),
    );
  }
}
