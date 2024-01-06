import 'package:flutter/material.dart';

import '../screens/home/widgets/search_text_field.dart';
import '../theme/app_theme.dart';

class SearchAppBar extends AppBar {
  SearchAppBar({String? query, Widget? leading, Widget? trailing})
      : super(
          elevation: 0,
          toolbarHeight: 54,
          centerTitle: false,
          iconTheme: IconThemeData(color: AppColors.dark),
          title: Row(
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: leading,
                ),
              Expanded(child: SearchTextField(query)),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: trailing,
                ),
            ],
          ),
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        );
}
