import 'package:flutter/material.dart';

import '../../app/generated/l10n.dart';
import '../theme/app_theme.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.content,
    required this.positiveButtonLabel,
    this.title,
    this.showNegativeButton = true,
    Key? key,
  }) : super(key: key);
  final String content;
  final String positiveButtonLabel;
  final String? title;
  final bool showNegativeButton;

  @override
  Widget build(BuildContext context) {
    // TODO Style it, if needed
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 32),
            if (title != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(
                  title!,
                  style: AppTextStyle.bold20,
                  textAlign: TextAlign.center,
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
              child: Text(
                content,
                style: AppTextStyle.dark16,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 1,
              color: AppColors.textInvisible,
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  if (showNegativeButton) ...[
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(false),
                        child: Text(
                          S.current.cancel,
                          style: AppTextStyle.grey16,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      color: AppColors.textInvisible,
                    ),
                  ],
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(true),
                      child: Text(
                        positiveButtonLabel,
                        style: AppTextStyle.grey16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
