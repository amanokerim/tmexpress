part of 'placed_order_bloc.dart';

abstract class PlacedOrderState extends Equatable {
  const PlacedOrderState();

  @override
  List<Object> get props => [];
}

class PlacedOrderLoad extends PlacedOrderState {}

class PlacedOrderSuccess extends PlacedOrderState {
  const PlacedOrderSuccess(this.order);
  final PlacedOrder order;
}

class PlacedOrderError extends PlacedOrderState {
  const PlacedOrderError({
    required this.message,
    required this.isAuthError,
  });

  final String message;
  final bool isAuthError;
}
