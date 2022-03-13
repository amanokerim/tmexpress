import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CardWrapper extends StatelessWidget {
  const CardWrapper({required this.child, this.padding, Key? key})
      : super(key: key);
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bg2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
