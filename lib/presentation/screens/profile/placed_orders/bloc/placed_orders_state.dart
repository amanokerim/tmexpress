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
  const PlacedOrdersError(this.error);
  final AppError error;

  @override
  List<Object> get props => [error];
}
