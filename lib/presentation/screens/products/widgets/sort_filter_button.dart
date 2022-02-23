import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class SortFilterButton extends StatelessWidget {
  const SortFilterButton(
    this.title,
    this.iconFile,
    this.onPressed, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String iconFile;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.lGrey, width: .5),
        color: AppColors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/$iconFile',
                    width: 16, color: AppColors.dark),
                const SizedBox(width: 8),
                Text(title, style: AppTextStyle.bold16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
