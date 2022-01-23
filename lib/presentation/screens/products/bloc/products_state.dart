part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsLoadInProgress extends ProductsState {}

class ProductsLoadSuccess extends ProductsState {
  const ProductsLoadSuccess(
    this.next,
    this.products, {
    this.clear = false,
  });
  final String? next;
  final List<ProductMini> products;
  final bool clear;

  @override
  List<Object?> get props => [next, products, clear];
}

class ProductsLoadError extends ProductsState {
  const ProductsLoadError(this.message, this.key);
  final String message;
  final Key key;

  @override
  List<Object> get props => [key];
}
