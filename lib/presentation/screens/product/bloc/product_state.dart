part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoadInProgress extends ProductState {}

class ProductLoadSuccess extends ProductState {
  const ProductLoadSuccess(this.products);
  final List<Product> products;

  @override
  List<Object> get props => [products];
}

class ProductLoadError extends ProductState {
  const ProductLoadError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
