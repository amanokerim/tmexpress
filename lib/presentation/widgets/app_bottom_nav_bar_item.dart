import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppBottomNavBarItem extends BottomNavigationBarItem {
  AppBottomNavBarItem({
    required String iconFile,
    required String label,
  }) : super(
          icon: Padding(
            padding: const EdgeInsets.only(top: 9, bottom: 7),
            child: Image.asset(
              'assets/icons/$iconFile.png',
              color: AppColors.dark,
              width: iconFile == 'media' ? 24 : 26,
            ),
          ),
          activeIcon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: AppColors.secondary,
            ),
            child: Image.asset(
              'assets/icons/$iconFile.png',
              color: AppColors.white,
              width: iconFile == 'media' ? 24 : 26,
            ),
          ),
          label: label,
        );
}
