import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/placed_order.dart';
import '../../../../../domain/usecases/order/get_placed_order.dart';
import '../../../../bloc/app_bloc.dart';

part 'placed_order_event.dart';
part 'placed_order_state.dart';

@injectable
class PlacedOrderBloc extends AppBloc<PlacedOrderEvent, PlacedOrderState> {
  PlacedOrderBloc(this._getPlacedOrderUseCase) : super(PlacedOrderLoad()) {
    on<PlacedOrderStarted>((event, emit) async {
      emit(PlacedOrderLoad());
      final r = await _getPlacedOrderUseCase(event.id);
      emit(r.fold(
        (f) =>
            PlacedOrderError(message: message(f), isAuthError: isAuthError(f)),
        (order) => PlacedOrderSuccess(order),
      ));
    });
  }

  final GetPlacedOrderUseCase _getPlacedOrderUseCase;
}
