import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../theme/app_theme.dart';
import '../bloc/cart_bloc.dart';

class DeliveryMethodSwitch extends StatelessWidget {
  const DeliveryMethodSwitch({required this.isExpress, Key? key})
      : super(key: key);
  final bool isExpress;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: isExpress,
      contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      activeColor: AppColors.secondary,
      dense: true,
      onChanged: (_) =>
          context.read<CartBloc>().add(CartDeliveryMethodChanged()),
      title: Text(
        isExpress ? S.current.express : S.current.normal,
        style: AppTextStyle.bold16,
      ),
      subtitle: Text(
        isExpress ? S.current.expressSubtitle : S.current.normalSubtitle,
        style: AppTextStyle.grey14,
      ),
    );
  }
}
