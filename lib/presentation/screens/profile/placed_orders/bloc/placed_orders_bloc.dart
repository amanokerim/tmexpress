import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/placed_order.dart';
import '../../../../../domain/usecases/order/fetch_orders_usecase.dart';
import '../../../../bloc/app_bloc.dart';

part 'placed_orders_event.dart';
part 'placed_orders_state.dart';

@injectable
class PlacedOrdersBloc extends AppBloc<PlacedOrdersEvent, PlacedOrdersState> {
  PlacedOrdersBloc(this._fetchPlacedOrdersUseCase) : super(PlacedOrdersLoad()) {
    on<PlacedOrdersStarted>((event, emit) async {
      emit(PlacedOrdersLoad());
      final r = await _fetchPlacedOrdersUseCase();

      emit(r.fold(
        (failure) => PlacedOrdersError(
            message: message(failure), isAuthError: isAuthError(failure)),
        (orders) => PlacedOrdersSuccess(orders),
      ));
    });
  }

  final FetchPlacedOrdersUseCase _fetchPlacedOrdersUseCase;
}
