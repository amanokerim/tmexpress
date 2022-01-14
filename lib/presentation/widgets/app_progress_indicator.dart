import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        'assets/animations/square_loader.json',
        height: 100,
      ),
    );
  }
}
