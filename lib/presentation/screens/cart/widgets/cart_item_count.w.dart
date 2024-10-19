import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/cart_item.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_confirm_dialog.dart';
import '../bloc/cart_bloc.dart';

class CartItemCountW extends StatelessWidget {
  const CartItemCountW(this.cartItem, {super.key});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CartBloc>();
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => minusPressed(context, bloc),
          icon: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: AppColors.grey, width: 1),
            ),
            child: const Icon(Icons.horizontal_rule, size: 12),
          ),
        ),
        Text('${cartItem.count}', style: AppTextStyle.black16),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => bloc.add(CartItemAdded(cartItem.copyWith(count: 1))),
          icon: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: AppColors.primary, width: 1),
            ),
            child: const Icon(Icons.add, size: 12, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Future<void> minusPressed(BuildContext context, CartBloc bloc) async {
    if (cartItem.count == 1) {
      final confirm = await showDialog<bool>(
          context: context,
          builder: (_) => AppDialog(
              content: S.current.confirmRemove,
              positiveButtonLabel: S.current.yes));
      if (confirm == true) bloc.add(CartItemRemoved(cartItem));
    } else {
      bloc.add(CartItemAdded(cartItem.copyWith(count: -1)));
    }
  }
}
