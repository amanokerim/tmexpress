import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PrimaryAppBar extends AppBar {
  PrimaryAppBar({required this.label, Key? key})
      : super(
          key: key,
          elevation: 0,
          centerTitle: false,
          title: Text(label, style: AppTextStyle.bold20),
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        );
  final String label;
}
