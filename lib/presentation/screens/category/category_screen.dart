import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/app_theme.dart';
import 'bloc/category_bloc.dart';
import 'widgets/category_card.dart';

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
                  itemCount: state.categories.length,
                  itemBuilder: (_, index) => CategoryCard(
                    state.categories[index],
                    selected: state.selectedId == state.categories[index].id,
                  ),
                  separatorBuilder: (_, __) =>
                      Container(height: .5, color: AppColors.grey),
                ),
              ),
            ),
            const Expanded(child: SizedBox(), flex: 3),
          ]),
        );
      } else if (state is CategoryLoadError) {
        return Text(state.message);
      }
      return const CircularProgressIndicator();
    });
  }
}
