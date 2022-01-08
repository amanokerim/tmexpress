import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_theme.dart';

class AppButton extends ElevatedButton {
  // TODO Style the button
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
            onPrimary: AppColors.grey5,
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
                      SvgPicture.asset(
                        'assets/icons/$iconFile',
                        color: paintIcon ? type.foreground : null,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      label,
                      style: AppTextStyle.headline6.copyWith(
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

enum ButtonType { red, black, outline, red2, grey, red3 }

extension ButtonTypeExtension on ButtonType {
  Color get background {
    switch (this) {
      case ButtonType.red:
        return AppColors.red;
      case ButtonType.red2:
        return AppColors.red2;
      case ButtonType.red3:
        return AppColors.red3;
      case ButtonType.black:
        return AppColors.dark;
      case ButtonType.outline:
        return AppColors.white;
      case ButtonType.grey:
        return AppColors.grey10;
    }
  }

  Color get foreground {
    if (this == ButtonType.outline) return AppColors.dark;
    if (this == ButtonType.grey) return AppColors.dark2;
    return AppColors.white;
  }
}
