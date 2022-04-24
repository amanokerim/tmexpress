import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppInfoCard extends StatelessWidget {
  const AppInfoCard(this.content, {Key? key}) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.lightBlue,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Image.asset(
              'assets/icons/information.png',
              width: 20,
              color: AppColors.textSec,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(content, style: AppTextStyle.grey16),
          ),
        ],
      ),
    );
  }
}
