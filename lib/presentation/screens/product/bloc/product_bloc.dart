import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/fetch_products_usecase.dart';
import '../../../bloc/app_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

@injectable
class ProductBloc extends AppBloc<ProductEvent, ProductState> {
  ProductBloc(this._fetchProductsUseCase) : super(ProductLoadInProgress()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductLoadInProgress());
      final result = await _fetchProductsUseCase();
      emit(result.fold(
        (failure) => ProductLoadError(mapError(failure)),
        (products) => ProductLoadSuccess(products),
      ));
    });
  }

  final FetchProductsUseCase _fetchProductsUseCase;
}
