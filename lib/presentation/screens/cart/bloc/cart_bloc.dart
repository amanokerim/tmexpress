import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;

import '../../../../domain/entities/cart_item.dart';
import '../../../../domain/entities/order/order.dart';
import '../../../../domain/entities/order/order_item.dart';
import '../../../../domain/entities/order/shipping_option.dart';
import '../../../../domain/errors/app_error.dart';
import '../../../../domain/usecases/order/create_order_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

const _initialState = CartState(
  CartSt.initial,
  [],
  0,
  isExpress: false,
  shippingOption: null,
);

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this._createOrderUseCase) : super(_initialState) {
    on<CartItemAdded>((event, emit) {
      final index = _items.indexWhere((item) => item == event.cartItem);
      if (index != -1) {
        _items[index] = _items[index].increase(event.cartItem.count);
      } else {
        _items.add(event.cartItem);
      }
      emit(cartState());
    });

    on<CartItemRemoved>((event, emit) {
      _items.remove(event.cartItem);
      emit(cartState());
    });

    on<CartCleared>((event, emit) {
      _items.clear();
      emit(cartState());
    });

    on<CartShippingOptionChanged>((event, emit) {
      _shippingOption = event.shippingOption;
      emit(cartState());
    });

    on<CartDeliveryMethodChanged>((event, emit) {
      _isExpress = !_isExpress;
      emit(cartState());
    });

    on<CartOrderPlaced>((event, emit) async {
      emit(cartState(st: CartSt.loading));
      final orderItems = _items
          .map((item) => OrderItem(
              product: item.product.id,
              qty: item.count,
              size: item.size.id,
              color: item.color.id))
          .toList();
      final order = Order(orderitems: orderItems, isExpress: _isExpress);
      final r = await _createOrderUseCase(order);
      emit(r.fold(
        (error) => cartState(error: error),
        (r) => cartState(st: CartSt.done),
      ));
    });
  }

  CartState cartState({CartSt st = CartSt.initial, AppError? error}) =>
      CartState(
        st,
        List.from(_items),
        total,
        isExpress: _isExpress,
        error: error,
        shippingOption: _shippingOption,
      );

  double get total {
    var t = 0.0;
    for (final c in _items) {
      t += c.count * (_isExpress ? c.expressPrice : c.price);
    }
    return t;
  }

  final _items = <CartItem>[];
  var _isExpress = false;
  ShippingOption? _shippingOption;

  final CreateOrderUseCase _createOrderUseCase;
}
