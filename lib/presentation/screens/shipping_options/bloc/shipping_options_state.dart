part of 'shipping_options_bloc.dart';

abstract class ShippingOptionsState extends Equatable {
  const ShippingOptionsState();

  @override
  List<Object?> get props => [];
}

class ShippingOptionsInitial extends ShippingOptionsState {}

class ShippingOptionsLoadSuccess extends ShippingOptionsState {
  const ShippingOptionsLoadSuccess({required this.shippingOptions});
  final List<ShippingOption> shippingOptions;

  @override
  List<Object?> get props => [shippingOptions];
}

class ShippingOptionsLoadError extends ShippingOptionsState {
  const ShippingOptionsLoadError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
