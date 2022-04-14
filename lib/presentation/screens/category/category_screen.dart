import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_progress_indicator.dart';
import 'bloc/category_bloc.dart';
import 'widgets/category.w.dart';
import 'widgets/group.w.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (_, state) {
      if (state is CategoryLoadSuccess) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(16)),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.categories.length,
                  itemBuilder: (_, index) => CategoryW(
                    state.categories[index],
                    selected: state.selected.id == state.categories[index].id,
                  ),
                  separatorBuilder: (_, __) =>
                      Container(height: .5, color: AppColors.grey),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemCount: state.selected.groups.length,
                itemBuilder: (_, index) =>
                    GroupWidget(state.selected.groups[index]),
              ),
            ),
          ]),
        );
      } else if (state is CategoryLoadError) {
        return AppErrorScreen(
            message: state.message,
            onPressed: () =>
                context.read<CategoryBloc>().add(CategoriesRequested()));
      }
      return const AppProgressIndicator();
    });
  }
}
