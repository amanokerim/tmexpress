import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/product/category.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';
import '../bloc/category_bloc.dart';

class CategoryW extends StatelessWidget {
  const CategoryW(this.category, {this.selected = false, Key? key})
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
        height: 100,
        decoration: BoxDecoration(
            color: selected ? AppColors.white : AppColors.bg2,
            border: selected
                ? Border(left: BorderSide(color: AppColors.secondary, width: 3))
                : null),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: selected ? 1 : .5,
              child: AppImage(
                category.categoryImage,
                height: 45,
                borderRadius: BorderRadius.circular(0),
                // color: selected ? AppColors.dark : AppColors.textSec,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              category.title,
              style: selected ? AppTextStyle.dark12 : AppTextStyle.grey12,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
