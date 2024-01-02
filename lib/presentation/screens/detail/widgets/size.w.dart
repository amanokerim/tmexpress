import 'package:flutter/material.dart' hide Size;

import '../../../../domain/entities/product/size.dart';
import '../../../theme/app_theme.dart';

class SizeW extends StatelessWidget {
  const SizeW(this.size,
      {required this.onPressed, this.selected = false, Key? key})
      : super(key: key);
  final Size size;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final title =
        size.title.contains('=') ? size.title.split('=').first : size.title;
    final subtitle = size.title.contains('=') ? size.title.split('=').last : '';
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: selected ? AppColors.secondary : AppColors.lGrey,
              width: 1),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTextStyle.black16.copyWith(
                color: selected ? AppColors.dark : AppColors.grey,
              ),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: AppTextStyle.dark12.copyWith(
                  color: selected ? AppColors.dark : AppColors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
