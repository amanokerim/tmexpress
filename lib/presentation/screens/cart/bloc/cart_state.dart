part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState(this.items, {required this.isExpress, required this.key});
  final List<CartItem> items;
  final bool isExpress;
  final bool key;

  @override
  List<Object> get props => [items, isExpress, key];
}
