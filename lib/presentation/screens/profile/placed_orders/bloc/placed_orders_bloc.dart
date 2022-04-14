import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/placed_order.dart';
import '../../../../../domain/errors/app_error.dart';
import '../../../../../domain/usecases/order/fetch_orders_usecase.dart';

part 'placed_orders_event.dart';
part 'placed_orders_state.dart';

@injectable
class PlacedOrdersBloc extends Bloc<PlacedOrdersEvent, PlacedOrdersState> {
  PlacedOrdersBloc(this._fetchPlacedOrdersUseCase) : super(PlacedOrdersLoad()) {
    on<PlacedOrdersStarted>((event, emit) async {
      emit(PlacedOrdersLoad());
      final r = await _fetchPlacedOrdersUseCase();

      emit(r.fold(
        (error) => PlacedOrdersError(error),
        (orders) => PlacedOrdersSuccess(orders),
      ));
    });
  }

  final FetchPlacedOrdersUseCase _fetchPlacedOrdersUseCase;
}
