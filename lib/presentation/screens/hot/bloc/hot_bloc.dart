import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product_mini.dart';
import '../../../../domain/usecases/products/fetch_hot_products.dart';

part 'hot_event.dart';
part 'hot_state.dart';

@injectable
class HotBloc extends Bloc<HotEvent, HotState> {
  HotBloc(this._fetchHotProducts) : super(HotInitial()) {
    on<HotRequested>((event, emit) async {
      final r = await _fetchHotProducts(event.next);
      emit(r.fold(
        (error) => HotLoadError(error.message),
        (pagination) => HotLoadSuccess(
          products: pagination.items,
          next: pagination.next,
        ),
      ));
    });
  }

  final FetchHotProducts _fetchHotProducts;
}
