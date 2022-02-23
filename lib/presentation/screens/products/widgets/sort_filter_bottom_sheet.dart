import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_button.dart';

class SortFilterBottomSheet extends StatelessWidget {
  const SortFilterBottomSheet({
    required this.title,
    required this.child,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final String title;
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        side: BorderSide(color: AppColors.lGrey, width: .5),
      ),
      onClosing: () {},
      builder: (_) => SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: 20,
              height: 3,
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              decoration: BoxDecoration(
                color: AppColors.lGrey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Text(title, style: AppTextStyle.bold18),
            child,
            Padding(
              padding: const EdgeInsets.all(16),
              child: AppButton(
                label: S.current.apply,
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
