import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/order/shipping_option.dart';
import '../../../../domain/usecases/order/fetch_shipping_options.dart';

part 'shipping_options_event.dart';
part 'shipping_options_state.dart';

@injectable
class ShippingOptionsBloc
    extends Bloc<ShippingOptionsEvent, ShippingOptionsState> {
  ShippingOptionsBloc(this._fetchShippingOptions)
      : super(ShippingOptionsInitial()) {
    on<ShippingOptionsRequested>((event, emit) async {
      final r = await _fetchShippingOptions();
      emit(r.fold(
        (error) => ShippingOptionsLoadError(error.message),
        (pagination) => ShippingOptionsLoadSuccess(
          shippingOptions: pagination.items,
        ),
      ));
    });
  }

  final FetchShippingOptions _fetchShippingOptions;
}
