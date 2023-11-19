part of 'shipping_options_bloc.dart';

abstract class ShippingOptionsEvent extends Equatable {
  const ShippingOptionsEvent();

  @override
  List<Object?> get props => [];
}

class ShippingOptionsRequested extends ShippingOptionsEvent {
  const ShippingOptionsRequested();

  @override
  List<Object?> get props => [];
}
