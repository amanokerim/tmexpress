import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product_mini.dart';
import '../../../../domain/entities/product_parent.dart';
import '../../../../domain/usecases/products/fetch_products_usecase.dart';
import '../../../bloc/app_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends AppBloc<ProductsEvent, ProductsState> {
  ProductsBloc(this._fetchProductsUseCase) : super(ProductsLoadInProgress()) {
    on<ProductsRequested>((event, emit) async {
      final result = await _fetchProductsUseCase(
          FetchProductsParams(productParent: event.productParent, next: next));
      emit(result.fold(
        (failure) => ProductsLoadError(mapError(failure), UniqueKey()),
        (pagination) {
          next = pagination.next;
          return ProductsLoadSuccess(pagination.next, pagination.items);
        },
      ));
    });
  }
  String? next;

  final FetchProductsUseCase _fetchProductsUseCase;
}
