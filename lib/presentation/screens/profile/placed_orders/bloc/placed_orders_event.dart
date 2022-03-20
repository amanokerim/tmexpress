part of 'placed_orders_bloc.dart';

abstract class PlacedOrdersEvent extends Equatable {
  const PlacedOrdersEvent();

  @override
  List<Object> get props => [];
}

class PlacedOrdersStarted extends PlacedOrdersEvent {}
