import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppBottomNavBarItem extends BottomNavigationBarItem {
  AppBottomNavBarItem({
    required this.iconFile,
    required this.label,
  }) : super(
          icon: Icon(iconFile, color: AppColors.tabBarInactive),
          activeIcon: Icon(iconFile, color: AppColors.dark),
          label: label,
        );
  final IconData iconFile;
  final String label;
}
