import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/cart_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState([], isExpress: false, key: false)) {
    on<CartEvent>((event, emit) => key = !key);

    on<CartItemAdded>((event, emit) {
      print(event.cartItem);
      final index = items.indexWhere((item) => item == event.cartItem);
      if (index != -1) {
        items[index] = items[index].increase(event.cartItem.count);
        print('-- increased');
      } else {
        items.add(event.cartItem);
        print('-- added');
      }
      emit(CartState(List.from(items), isExpress: isExpress, key: key));
    });

    on<CartItemRemoved>((event, emit) {
      items.remove(event.cartItem);
      emit(CartState(List.from(items), isExpress: isExpress, key: key));
    });

    on<CartCleared>((event, emit) {
      items.clear();
      emit(CartState(List.from(items), isExpress: isExpress, key: key));
    });
  }

  List<CartItem> items = [];
  bool isExpress = false;
  bool key = false;
}
