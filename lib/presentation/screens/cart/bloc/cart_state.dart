part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState(this.items, this.total, {required this.isExpress});
  final List<CartItem> items;
  final bool isExpress;
  final double total;

  @override
  List<Object> get props => [items, isExpress, total];
}
