import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../../app/generated/l10n.dart';
import '../theme/app_theme.dart';
import 'constants.dart';

FlashController<void>? _previousController;

class AppFlash {
  // TODO Change flash error style
  static Future<void>? bigToast({
    required BuildContext context,
    required String message,
    String? buttonLabel,
    VoidCallback? onPressed,
  }) {
    final oneLiner = message.length <= 15;
    if (_previousController?.isDisposed == false) {
      _previousController?.dismiss();
    }
    _previousController = FlashController(
      context,
      builder: (context, controller) {
        final action = TextButton(
          onPressed: () {
            onPressed!();
            controller.dismiss();
          },
          child: Text(
            buttonLabel ?? S.current.retry,
            style: AppTextStyle.bold14,
          ),
        );
        return Flash<void>(
          controller: controller,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          enableVerticalDrag: true,
          onTap: controller.dismiss,
          alignment: const Alignment(0, -.92),
          boxShadows: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          backgroundColor: AppColors.dark,
          forwardAnimationCurve: Curves.easeInCirc,
          reverseAnimationCurve: Curves.easeInCirc,
          child: FlashBar(
              padding: EdgeInsets.fromLTRB(
                  16, 16, 16, onPressed == null || oneLiner ? 16 : 0),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(message, style: AppTextStyle.dark18),
                  if (oneLiner) action,
                ],
              ),
              actions: [
                if (!oneLiner && onPressed != null) ...[
                  action,
                  const SizedBox(width: 4)
                ]
              ]),
        );
      },
      duration: kToastDuration,
    );
    return _previousController?.show();
  }

  static Future<void>? toast({
    required BuildContext context,
    required String message,
  }) {
    if (_previousController?.isDisposed == false) {
      _previousController?.dismiss();
    }
    _previousController = FlashController(
      context,
      builder: (context, controller) {
        return Flash<void>(
          controller: controller,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          enableVerticalDrag: true,
          onTap: controller.dismiss,
          alignment: const Alignment(0, -.92),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          backgroundColor: Colors.white54,
          child: GestureDetector(
            onTapDown: controller.dismiss,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(message),
            ),
          ),
        );
      },
      duration: kToastDuration,
    );
    return _previousController?.show();
  }
}
