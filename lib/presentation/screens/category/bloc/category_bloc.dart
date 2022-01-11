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
          return CategoryLoadSuccess(categories, 0);
        },
      ));
    });

    on<CategorySelected>((event, emit) async {
      selectedId = event.id;
      emit(CategoryLoadSuccess(categories, selectedId));
    });
  }

  final FetchProductsUseCase _fetchProductsUseCase;

  int selectedId = 0;
  List<Category> categories = [];
}
