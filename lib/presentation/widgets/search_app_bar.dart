import 'package:flutter/material.dart';

import '../screens/home/widgets/search_text_field.dart';
import '../theme/app_theme.dart';

class SearchAppBar extends AppBar {
  SearchAppBar([String? query])
      : super(
          elevation: 0,
          toolbarHeight: 54,
          centerTitle: false,
          iconTheme: IconThemeData(color: AppColors.dark),
          title: SearchTextField(query),
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        );
}
