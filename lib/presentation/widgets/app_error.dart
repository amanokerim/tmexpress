import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/generated/l10n.dart';
import '../theme/app_theme.dart';
import 'app_button.dart';

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
          SvgPicture.asset('assets/illustrations/error.svg', height: 300),
          const SizedBox(height: 24),
          Text(message, style: AppTextStyle.grey20),
          const Spacer(),
          AppButton(
              label: S.current.retry,
              type: ButtonType.outline,
              iconFile: 'refresh.png',
              onPressed: onPressed),
          if (padding == null) const SizedBox(height: 16)
        ],
      ),
    );
  }
}
