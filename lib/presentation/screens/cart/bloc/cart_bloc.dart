import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/cart_item.dart';
import '../../../bloc/app_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends AppBloc<CartEvent, CartState> {
  CartBloc() : super(const CartState([], 0, isExpress: false)) {
    on<CartItemAdded>((event, emit) {
      final index = items.indexWhere((item) => item == event.cartItem);
      if (index != -1) {
        items[index] = items[index].increase(event.cartItem.count);
      } else {
        items.add(event.cartItem);
      }
      emit(st);
    });

    on<CartItemRemoved>((event, emit) {
      items.remove(event.cartItem);
      emit(st);
    });

    on<CartCleared>((event, emit) {
      items.clear();
      emit(st);
    });

    on<CartDeliveryMethodChanged>((event, emit) {
      isExpress = !isExpress;
      emit(st);
    });
  }

  CartState get st => CartState(List.from(items), total, isExpress: isExpress);

  double get total {
    var t = 0.0;
    for (final c in items) {
      t += c.count * (isExpress ? c.expressPrice : c.price);
    }
    return t;
  }

  List<CartItem> items = [];
  bool isExpress = false;
  bool key = false;
}
