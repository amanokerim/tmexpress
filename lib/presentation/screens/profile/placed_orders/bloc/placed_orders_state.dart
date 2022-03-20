part of 'placed_orders_bloc.dart';

abstract class PlacedOrdersState extends Equatable {
  const PlacedOrdersState();

  @override
  List<Object> get props => [];
}

class PlacedOrdersLoad extends PlacedOrdersState {}

class PlacedOrdersSuccess extends PlacedOrdersState {
  const PlacedOrdersSuccess(this.orders);
  final List<PlacedOrder> orders;
}

class PlacedOrdersError extends PlacedOrdersState {
  const PlacedOrdersError({
    required this.message,
    required this.isAuthError,
  });
  final String message;
  final bool isAuthError;

  @override
  List<Object> get props => [message, isAuthError];
}
