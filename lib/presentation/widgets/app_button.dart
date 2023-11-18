import 'package:flutter/material.dart';

import '../../domain/entities/enums/button_type.dart';
import '../theme/app_theme.dart';

export '../../domain/entities/enums/button_type.dart';

class AppButton extends ElevatedButton {
  AppButton({
    required String? label,
    required VoidCallback? onPressed,
    ButtonType type = ButtonType.red,
    String? iconFile,
    bool isLoading = false,
    Widget? child,
  }) : super(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: type.background,
            disabledBackgroundColor: type.background,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 1),
            shadowColor: Colors.black38,
            foregroundColor: AppColors.grey,
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
          child: child ??
              Padding(
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
                        style: AppTextStyle.bold16
                            .copyWith(color: type.foreground),
                      ),
                  ],
                ),
              ),
        );
}
