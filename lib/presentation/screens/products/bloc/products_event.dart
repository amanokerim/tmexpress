part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class ProductsRequested extends ProductsEvent {
  const ProductsRequested({
    required this.productParent,
    this.next,
  });
  final SubTag productParent;
  final String? next;

  @override
  List<Object?> get props => [productParent, next];
}

class ProductsSortTypeChanged extends ProductsEvent {
  const ProductsSortTypeChanged(this.sortType);
  final SortType sortType;

  @override
  List<Object> get props => [sortType];
}

class ProductsFilterOptionsChanged extends ProductsEvent {
  const ProductsFilterOptionsChanged(this.filterOptions);
  final FilterOptions filterOptions;

  @override
  List<Object> get props => [filterOptions];
}
