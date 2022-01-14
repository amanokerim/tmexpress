import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product_mini.dart';
import '../../../../domain/usecases/fetch_products_usecase.dart';
import '../../../bloc/app_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends AppBloc<ProductsEvent, ProductsState> {
  ProductsBloc(this._fetchProductsUseCase) : super(ProductsLoadInProgress()) {
    on<ProductsRequested>((event, emit) async {
      if (event.type != null) type = event.type!;
      if (event.id != null) id = event.id!;

      final result = await _fetchProductsUseCase(FetchProductsParams(
          type: event.type ?? type, id: event.id ?? id, next: next));
      emit(result.fold(
        (failure) => ProductsLoadError(mapError(failure)),
        (pagination) {
          next = pagination.next;
          return ProductsLoadSuccess(pagination.next, pagination.items);
        },
      ));
    });
  }
  String? next;
  late ProductsScreenType type;
  late int id;

  final FetchProductsUseCase _fetchProductsUseCase;
}
