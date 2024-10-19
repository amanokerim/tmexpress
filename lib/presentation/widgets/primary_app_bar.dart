import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PrimaryAppBar extends AppBar {
  PrimaryAppBar({required this.label, this.action, super.key})
      : super(
          elevation: 0,
          toolbarHeight: 54,
          centerTitle: false,
          iconTheme: IconThemeData(color: AppColors.dark),
          title: Text(label, style: AppTextStyle.bold20),
          backgroundColor: AppColors.white,
          actions: action != null ? [action] : null,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        );
  final String label;
  final Widget? action;
}
