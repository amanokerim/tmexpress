part of 'placed_order_bloc.dart';

abstract class PlacedOrderEvent extends Equatable {
  const PlacedOrderEvent();

  @override
  List<Object> get props => [];
}

class PlacedOrderStarted extends PlacedOrderEvent {
  const PlacedOrderStarted(this.id);
  final int id;
}
