import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product/product_mini.dart';
import '../../../../domain/usecases/products/search_product_usecase.dart';

part 'hot_event.dart';
part 'hot_state.dart';

@injectable
class HotBloc extends Bloc<HotEvent, HotState> {
  HotBloc(this._searchProducts) : super(HotInitial()) {
    on<HotRequested>((event, emit) async {
      final r = await _searchProducts(SearchParams(
          query: '', nextRaw: event.page, isRandom: 1, title: 'rand'));
      emit(r.fold(
        (error) => HotLoadError(error.message),
        (pagination) => HotLoadSuccess(
          products: pagination.items,
          next: pagination.next,
        ),
      ));
    });
  }

  final SearchProductsUseCase _searchProducts;
}
