import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product_mini.dart';
import '../../../../domain/entities/product_parent.dart';
import '../../../../domain/entities/tag.dart';
import '../../../../domain/usecases/fetch_products_usecase.dart';
import '../../../bloc/app_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends AppBloc<ProductsEvent, ProductsState> {
  ProductsBloc(this._fetchProductsUseCase) : super(ProductsLoadInProgress()) {
    on<ProductsRequested>((event, emit) async {
      if (event.productParent != null) {
        type = event.productParent is Tag
            ? type = ProductsScreenType.tag
            : type = ProductsScreenType.subcategory;
      }
      if (event.productParent?.id != null) id = event.productParent!.id;

      final result = await _fetchProductsUseCase(FetchProductsParams(
          type: type, id: event.productParent?.id ?? id, next: next));
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
  late ProductsScreenType type;
  late int id;

  final FetchProductsUseCase _fetchProductsUseCase;
}
