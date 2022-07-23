import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/order/placed_order.dart';
import '../../../../../domain/errors/app_error.dart';
import '../../../../../domain/usecases/order/get_placed_order.dart';

part 'placed_order_event.dart';
part 'placed_order_state.dart';

@injectable
class PlacedOrderBloc extends Bloc<PlacedOrderEvent, PlacedOrderState> {
  PlacedOrderBloc(this._getPlacedOrderUseCase) : super(PlacedOrderLoad()) {
    on<PlacedOrderStarted>((event, emit) async {
      emit(PlacedOrderLoad());
      final r = await _getPlacedOrderUseCase(event.id);
      emit(r.fold(
        (error) => PlacedOrderError(error),
        (order) => PlacedOrderSuccess(order),
      ));
    });
  }

  final GetPlacedOrderUseCase _getPlacedOrderUseCase;
}
