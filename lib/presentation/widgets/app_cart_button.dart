import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/cart/bloc/cart_bloc.dart';
import '../screens/cart/cart_screen.dart';
import '../theme/app_theme.dart';

class AppCartButton extends StatelessWidget {
  const AppCartButton({this.size = 28, Key? key}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute<void>(builder: (_) => const CartScreen())),
      child: SizedBox(
        width: size,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (_, state) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 5, 8),
                  child: Image.asset(
                    'assets/icons/basket.png',
                  ),
                ),
                if (state.items.isNotEmpty)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondary,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        state.items.length.toString(),
                        style: AppTextStyle.white10w700,
                      ),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
