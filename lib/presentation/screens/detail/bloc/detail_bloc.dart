import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/fetch_product_usecase.dart';
import '../../../bloc/app_bloc.dart';

part 'detail_event.dart';
part 'detail_state.dart';

@injectable
class DetailBloc extends AppBloc<DetailEvent, DetailState> {
  DetailBloc(this._fetchProductUseCase) : super(DetailLoadInProgress()) {
    on<DetailRequested>((event, emit) async {
      emit(DetailLoadInProgress());
      final result = await _fetchProductUseCase(event.id);
      emit(result.fold(
        (failure) => DetailLoadError(mapError(failure), UniqueKey()),
        (product) => DetailLoadSuccess(product),
      ));
    });
  }

  final FetchProductUseCase _fetchProductUseCase;
}
