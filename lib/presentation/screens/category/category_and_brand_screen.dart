import 'package:flutter/material.dart';

import '../../../app/generated/l10n.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_cart_button.dart';
import 'brands_screen.dart';
import 'categories_screen.dart';

class CategoriesAndBrandsScreen extends StatelessWidget {
  const CategoriesAndBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            children: [
              Expanded(
                child: TabBar(
                  indicatorColor: AppColors.secondary,
                  labelStyle: AppTextStyle.bold16,
                  unselectedLabelStyle: AppTextStyle.dark16,
                  dividerColor: Colors.transparent,
                  labelColor: AppColors.primary,
                  tabs: [
                    Tab(
                      child: Text(S.current.categories),
                    ),
                    Tab(
                      child: Text(S.current.brands),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: AppCartButton(),
              ),
            ],
          ),
          const Expanded(
            child: TabBarView(children: [
              CategoriesScreen(),
              BrandsScreen(),
            ]),
          )
        ],
      ),
    );
  }
}
