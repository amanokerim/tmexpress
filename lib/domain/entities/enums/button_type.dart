import 'package:flutter/material.dart';

import '../../../presentation/theme/app_theme.dart';

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
