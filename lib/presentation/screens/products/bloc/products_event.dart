part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductsRequested extends ProductsEvent {
  const ProductsRequested({
    required this.productParent,
    this.next,
  });
  final SubTag productParent;
  final String? next;
}
