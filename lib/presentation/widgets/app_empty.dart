import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_theme.dart';

/// Widget for showing empty screen
class AppEmpty extends StatelessWidget {
  const AppEmpty({
    required this.message,
    this.padding = const EdgeInsets.all(16),
    super.key,
  });

  final String message;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SvgPicture.asset(
              'assets/illustrations/empty.svg',
              width: 300,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            message,
            style: AppTextStyle.grey16.copyWith(height: 1.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
