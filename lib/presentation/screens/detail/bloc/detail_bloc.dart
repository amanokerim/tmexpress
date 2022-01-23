import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/image.dart';
import '../../../../domain/entities/product.dart';
import '../../../../domain/entities/size.dart';
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
        (product) {
          this.product = product;
          return success;
        },
      ));
    });

    on<DetailColorChanged>((event, emit) {
      selectedColor = event.color;
      emit(success);
    });

    on<DetailSizeChanged>((event, emit) {
      selectedSize = event.size;
      emit(success);
    });
  }

  DetailLoadSuccess get success => DetailLoadSuccess(
        product,
        selectedSize: selectedSize,
        selectedColor: selectedColor,
      );

  final FetchProductUseCase _fetchProductUseCase;
  late Product product;
  Size? selectedSize;
  Image? selectedColor;
}
