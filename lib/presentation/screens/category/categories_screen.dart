import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_error.dart';
import '../../widgets/app_loader.dart';
import 'bloc/category_bloc.dart';
import 'widgets/category.w.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (_, state) {
      if (state is CategoryLoadSuccess) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: .8,
          ),
          itemCount: state.categories.length,
          itemBuilder: (context, index) => CategoryW(
            state.categories[index],
          ),
        );
      } else if (state is CategoryLoadError) {
        return AppErrorScreen(
          message: state.message,
          onPressed: () =>
              context.read<CategoryBloc>().add(CategoriesRequested()),
        );
      }
      return const AppLoader();
    });
  }
}
