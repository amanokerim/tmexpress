part of 'cart_bloc.dart';

enum CartSt { initial, loading, done }

class CartState extends Equatable {
  const CartState(
    this.st,
    this.items,
    this.total, {
    required this.shippingOption,
    this.error,
  });
  final List<CartItem> items;
  final double total;
  final AppError? error;
  final CartSt st;
  final ShippingOption? shippingOption;

  @override
  List<Object?> get props => [st, items, total, error, shippingOption];
}
