import 'package:flutter/material.dart';

import '../../app/generated/l10n.dart';
import '../theme/app_theme.dart';

class AppConfirmDialog extends StatelessWidget {
  const AppConfirmDialog({
    required this.content,
    required this.positiveButtonLabel,
    this.title,
    Key? key,
  }) : super(key: key);
  final String content;
  final String positiveButtonLabel;
  final String? title;

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
                  style: AppTextStyle.headline4,
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
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(false),
                    child: Text(
                      S.current.cancel,
                      style: AppTextStyle.grey16_3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 1,
                  color: AppColors.textInvisible,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(true),
                    child: Text(
                      positiveButtonLabel,
                      style: AppTextStyle.grey16_3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
