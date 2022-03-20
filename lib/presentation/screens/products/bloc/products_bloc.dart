import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/enums/sort_types.dart';
import '../../../../domain/entities/interface/filter_options.dart';
import '../../../../domain/entities/product_mini.dart';
import '../../../../domain/entities/sub_tag.dart';
import '../../../../domain/usecases/products/fetch_products_usecase.dart';
import '../../../bloc/app_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends AppBloc<ProductsEvent, ProductsState> {
  ProductsBloc(this._fetchProductsUseCase) : super(ProductsLoadInProgress()) {
    on<ProductsRequested>((event, emit) async {
      _productParent = event.productParent;
      final result = await _fetchProductsUseCase(FetchProductsParams(
          productParent: _productParent,
          next: next,
          sortType: sortType,
          filterOptions: _filterOptions));
      emit(result.fold(
        (failure) => ProductsLoadError(message(failure), UniqueKey()),
        (pagination) {
          next = pagination.next;
          return ProductsLoadSuccess(pagination.next, pagination.items);
        },
      ));
    });

    on<ProductsSortTypeChanged>((event, emit) {
      sortType = event.sortType;
    });

    on<ProductsFilterOptionsChanged>((event, emit) {
      _filterOptions = event.filterOptions;
    });
  }
  String? next;
  SortType sortType = SortType.time;
  FilterOptions _filterOptions =
      const FilterOptions(isDiscounted: false, sizes: []);
  late SubTag _productParent;

  final FetchProductsUseCase _fetchProductsUseCase;
}
