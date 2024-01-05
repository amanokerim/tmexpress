import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({this.size = 100, Key? key}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        'assets/animations/square_loader.json',
        height: size,
      ),
    );
  }
}
