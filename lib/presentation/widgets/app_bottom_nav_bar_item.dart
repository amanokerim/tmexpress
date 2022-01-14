import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppBottomNavBarItem extends BottomNavigationBarItem {
  AppBottomNavBarItem({
    required this.iconFile,
  }) : super(
          icon: Image.asset('assets/icons/$iconFile.png',
              color: AppColors.dark, width: 26),
          activeIcon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: AppColors.secondary,
            ),
            child: Image.asset('assets/icons/$iconFile.png',
                color: AppColors.white, width: 26),
          ),
          label: '',
        );
  final String iconFile;
}
