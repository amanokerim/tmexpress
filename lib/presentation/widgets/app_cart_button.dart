import 'package:flutter/material.dart';

import '../screens/cart/cart_screen.dart';

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
        child: Image.asset(
          'assets/icons/basket.png',
        ),
      ),
    );
  }
}
