part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchLoad extends SearchState {}

class SearchSuccess extends SearchState {
  const SearchSuccess(
    this.next,
    this.products, {
    this.clear = false,
  });
  final String? next;
  final List<ProductMini> products;
  final bool clear;

  @override
  List<Object?> get props => [next, products];
}

class SearchError extends SearchState {
  const SearchError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
