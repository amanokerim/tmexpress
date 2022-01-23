import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/cart_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState([], isExpress: false)) {
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
  }

  CartState get st => CartState(items, isExpress: isExpress);

  List<CartItem> items = [];
  bool isExpress = false;
}
