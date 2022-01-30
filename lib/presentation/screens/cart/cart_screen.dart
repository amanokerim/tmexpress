import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: state.items.length,
          itemBuilder: (_, index) =>
              CartItemCard(state.items[index], isExpress: state.isExpress),
          separatorBuilder: (_, __) => const SizedBox(height: 16),
        );
      },
    );
  }
}
