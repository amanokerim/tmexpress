part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductsRequested extends ProductsEvent {
  const ProductsRequested({
    this.next,
    this.type,
    this.id,
  });
  final ProductsScreenType? type;
  final int? id;
  final String? next;
}
