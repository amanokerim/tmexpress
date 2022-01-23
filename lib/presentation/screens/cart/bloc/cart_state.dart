part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState(this.items, {required this.isExpress});
  final List<CartItem> items;
  final bool isExpress;

  @override
  List<Object> get props => [items, isExpress];
}
