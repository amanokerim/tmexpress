import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/app_theme.dart';
import '../cubit/media_category_cubit.dart';

class MediaCategories extends StatelessWidget {
  const MediaCategories({
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final void Function(int, int) onSelected;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCategoryCubit, MediaCategoryState>(
      builder: (_, state) {
        if (state is MediaCategorySuccess) {
          final cats = state.categories;
          return Container(
            height: 32,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: cats.length,
              itemBuilder: (_, index) {
                final selected = index == this.selected;
                return GestureDetector(
                  onTap: () => onSelected(index, cats[index].id),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        color: selected ? AppColors.secondary : AppColors.lGrey,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      cats[index].title,
                      style: AppTextStyle.bold16.copyWith(
                        color: selected ? AppColors.white : AppColors.dark,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 12),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
