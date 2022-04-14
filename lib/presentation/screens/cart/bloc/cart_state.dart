part of 'cart_bloc.dart';

enum CartSt { initial, loading, done }

class CartState extends Equatable {
  const CartState(
    this.st,
    this.items,
    this.total, {
    required this.isExpress,
    this.error,
  });
  final List<CartItem> items;
  final bool isExpress;
  final double total;
  final AppError? error;
  final CartSt st;

  @override
  List<Object?> get props => [st, items, isExpress, total, error];
}
