import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/category/category.dart';
import '../../../../domain/usecases/category/fetch_categories_usecase.dart';
import '../../../bloc/app_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

@injectable
class CategoryBloc extends AppBloc<CategoryEvent, CategoryState> {
  CategoryBloc(this._fetchProductsUseCase) : super(CategoryInitial()) {
    on<CategoriesReuqested>((event, emit) async {
      final result = await _fetchProductsUseCase();
      emit(result.fold(
        (failure) => CategoryLoadError(mapError(failure)),
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

  final FetchProductsUseCase _fetchProductsUseCase;

  late Category selected;
  List<Category> categories = [];
}
