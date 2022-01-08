import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

// TODO Style it

/// Widget for showing empty screen
class AppEmpty extends StatelessWidget {
  const AppEmpty({
    required this.message,
    this.padding = const EdgeInsets.all(16),
    Key? key,
  }) : super(key: key);

  final String message;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/empty.png'),
          const SizedBox(height: 24),
          Text(message,
              style: AppTextStyle.grey16.copyWith(height: 1.5),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
