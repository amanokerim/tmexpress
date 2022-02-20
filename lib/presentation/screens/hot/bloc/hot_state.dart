part of 'hot_bloc.dart';

abstract class HotState extends Equatable {
  const HotState();

  @override
  List<Object?> get props => [];
}

class HotInitial extends HotState {}

class HotLoadSuccess extends HotState {
  const HotLoadSuccess({
    required this.products,
    required this.next,
  });
  final List<ProductMini> products;
  final String? next;

  @override
  List<Object?> get props => [products, next];
}

class HotLoadError extends HotState {
  const HotLoadError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
