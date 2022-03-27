import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppButton extends ElevatedButton {
  AppButton({
    required String? label,
    required VoidCallback? onPressed,
    ButtonType type = ButtonType.red,
    String? iconFile,
    bool isLoading = false,
  }) : super(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: type.background,
            onSurface: type.background,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 1),
            shadowColor: Colors.black38,
            onPrimary: AppColors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: type == ButtonType.outline
                  ? BorderSide(
                      color: AppColors.textSec,
                      width: .5,
                    )
                  : BorderSide.none,
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 14),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLoading) ...[
                  SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                          color: type.foreground, strokeWidth: 2)),
                  const SizedBox(width: 8),
                ] else if (iconFile != null)
                  Image.asset(
                    'assets/icons/$iconFile',
                    color: type.foreground,
                    width: 20,
                  ),
                if (label != null && (iconFile != null || isLoading))
                  const SizedBox(width: 8),
                if (label != null)
                  Text(
                    label,
                    style: AppTextStyle.bold16.copyWith(
                      color: type.foreground,
                    ),
                  ),
              ],
            ),
          ),
        );
}

enum ButtonType { red, black, outline }

extension ButtonTypeExtension on ButtonType {
  Color get background {
    switch (this) {
      case ButtonType.red:
        return AppColors.secondary;
      case ButtonType.black:
        return AppColors.dark;
      case ButtonType.outline:
        return AppColors.white;
    }
  }

  Color get foreground {
    if (this == ButtonType.outline) return AppColors.dark;
    return AppColors.white;
  }
}
