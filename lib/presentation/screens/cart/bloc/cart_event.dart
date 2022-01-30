part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartItemAdded extends CartEvent {
  const CartItemAdded(this.cartItem);
  final CartItem cartItem;

  @override
  List<Object> get props => [cartItem];
}

class CartItemRemoved extends CartEvent {
  const CartItemRemoved(this.cartItem);
  final CartItem cartItem;

  @override
  List<Object> get props => [cartItem];
}

class CartCleared extends CartEvent {}
