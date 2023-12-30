import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/product/product_mini.dart';
import '../../../../../domain/usecases/products/search_product_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._searchProductsUseCase) : super(SearchLoad()) {
    on<SearchRequested>((event, emit) async {
      final r = await _searchProductsUseCase(
          SearchParams.withNext(event.params, event.next));
      emit(r.fold(
        (error) => SearchError(error.message),
        (pagination) => SearchSuccess(pagination.next, pagination.items,
            clear: event.clear),
      ));
    });
  }

  final SearchProductsUseCase _searchProductsUseCase;
}
