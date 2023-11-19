import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/generated/l10n.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_progress_indicator.dart';
import '../products/products_page.dart';
import 'bloc/category_bloc.dart';
import 'widgets/category.w.dart';
import 'widgets/group.w.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (_, state) {
      if (state is CategoryLoadSuccess) {
        final groups = state.selected.groups
            .where((g) => g.subCategories.isNotEmpty)
            .toList();
        print(groups.map((e) => '${e.title} ${e.subCategories.length}'));
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
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: AppButton(
                          onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => ProductsPage(
                                      productParent: state.selected),
                                ),
                              ),
                          type: ButtonType.outline,
                          label: '',
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 12),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      '${S.current.all2} '
                                      '${state.selected.title.toLowerCase()}',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.bold16),
                                ),
                                Image.asset('assets/icons/angle-right.png',
                                    width: 24),
                              ],
                            ),
                          )),
                    ),
                  ),
                  SliverList.separated(
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                    itemCount: groups.length,
                    itemBuilder: (_, index) => GroupWidget(groups[index]),
                  ),
                ],
              ),
            ),
          ]),
        );
      } else if (state is CategoryLoadError) {
        return AppErrorScreen(
          message: state.message,
          onPressed: () =>
              context.read<CategoryBloc>().add(CategoriesRequested()),
        );
      }
      return const AppProgressIndicator();
    });
  }
}
