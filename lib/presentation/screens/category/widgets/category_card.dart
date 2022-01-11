import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/category/category.dart';
import '../../../theme/app_theme.dart';
import '../bloc/category_bloc.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.category, {this.selected = false, Key? key})
      : super(key: key);
  final Category category;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.read<CategoryBloc>().add(CategorySelected(category.id)),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 84,
        decoration: BoxDecoration(
            color: selected ? AppColors.bg : AppColors.bg2,
            border: selected
                ? Border(left: BorderSide(color: AppColors.secondary, width: 3))
                : null),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              category.categoryImage,
              height: 32,
              color: selected ? AppColors.dark : AppColors.textSec,
            ),
            const SizedBox(height: 4),
            Text(
              category.title,
              style: selected ? AppTextStyle.dark14 : AppTextStyle.grey14,
              maxLines: 2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
