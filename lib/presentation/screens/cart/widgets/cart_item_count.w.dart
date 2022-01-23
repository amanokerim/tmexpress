import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/cart_item.dart';
import '../../../theme/app_theme.dart';
import '../bloc/cart_bloc.dart';

class CartItemCountW extends StatelessWidget {
  const CartItemCountW(this.cartItem, {Key? key}) : super(key: key);
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => context
              .read<CartBloc>()
              .add(CartItemAdded(cartItem.copyWith(count: -1))),
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
          onPressed: () => context
              .read<CartBloc>()
              .add(CartItemAdded(cartItem.copyWith(count: 1))),
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
}
