import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../theme/app_theme.dart';
import 'app_button.dart';

// TODO Style it

/// Widget for showing error screen
class AppError extends StatelessWidget {
  const AppError({
    required this.message,
    required this.onPressed,
    this.height,
    this.padding = const EdgeInsets.all(16),
    Key? key,
  }) : super(key: key);

  final String message;
  final VoidCallback onPressed;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset('assets/images/no_internet.png'),
          const SizedBox(height: 24),
          Text(message, style: AppTextStyle.grey16),
          const Spacer(),
          AppButton(label: S.current.retry, onPressed: onPressed),
          if (padding == null) const SizedBox(height: 16)
        ],
      ),
    );
  }
}
