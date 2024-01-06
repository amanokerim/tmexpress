import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product/category.dart';
import '../../../../domain/entities/product/subcategory.dart';
import '../../../../domain/usecases/products/fetch_categories_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this._fetchProductsUseCase) : super(CategoryInitial()) {
    on<CategoriesRequested>((event, emit) async {
      final result = await _fetchProductsUseCase();
      emit(result.fold(
        (error) => CategoryLoadError(error.message),
        (categories) {
          this.categories = categories;
          selected = categories[0];
          return CategoryLoadSuccess(categories, selected);
        },
      ));
    });

    on<CategorySelected>((event, emit) async {
      selected = categories.firstWhere((c) => c.id == event.id);

      emit(CategoryLoadSuccess(categories, selected));
    });
  }

  final FetchCategoriesUseCase _fetchProductsUseCase;

  late Category selected;
  List<Category> categories = [];
}
