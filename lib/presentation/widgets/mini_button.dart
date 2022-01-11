import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_theme.dart';
import 'app_button.dart';

class MiniButton extends ElevatedButton {
  MiniButton({
    required String iconFile,
    required VoidCallback onPressed,
    ButtonType type = ButtonType.outline,
    bool loading = false,
  }) : super(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: const Size(54, 54),
            maximumSize: const Size(54, 54),
            primary: type.background,
            shadowColor: Colors.black38,
            onPrimary: AppColors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: type == ButtonType.outline
                    ? AppColors.textSec
                    : type.background,
                width: .5,
              ),
            ),
          ),
          onPressed: onPressed,
          child: loading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    backgroundColor: type.foreground,
                    strokeWidth: 2,
                  ),
                )
              : SvgPicture.asset(
                  'assets/icons/$iconFile',
                  color: type.foreground,
                ),
        );
}
