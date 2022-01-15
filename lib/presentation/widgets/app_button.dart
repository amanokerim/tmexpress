import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppButton extends ElevatedButton {
  AppButton({
    required String label,
    required VoidCallback? onPressed,
    ButtonType type = ButtonType.red,
    String? iconFile,
    double? fontSize,
    bool paintIcon = true,
    bool isLoading = false,
    bool isCentered = true,
    bool mini = false,
    bool shrinkWrap = false,
    bool borderLess = false,
  }) : super(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: type.background,
            onSurface: type.background,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 1),
            shadowColor: Colors.black38,
            onPrimary: AppColors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(mini ? 13 : 20),
              side: type == ButtonType.outline && !borderLess
                  ? BorderSide(
                      color: AppColors.textSec,
                      width: .5,
                    )
                  : BorderSide.none,
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  mini ? 10 : 16,
                  0,
                  mini ? 10 : (isLoading ? 12 : 14),
                ),
                child: Row(
                  mainAxisSize:
                      shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
                  mainAxisAlignment: isCentered
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    if (iconFile != null) ...[
                      Image.asset(
                        'assets/icons/$iconFile',
                        color: paintIcon ? type.foreground : null,
                        width: 20,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      label,
                      style: AppTextStyle.bold16.copyWith(
                        fontSize: mini ? 12 : fontSize,
                        color: type.foreground,
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading)
                LinearProgressIndicator(
                  backgroundColor: type.background,
                  valueColor: AlwaysStoppedAnimation<Color>(type.foreground),
                  minHeight: 2,
                )
            ],
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
