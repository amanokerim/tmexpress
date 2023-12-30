part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchRequested extends SearchEvent {
  const SearchRequested(this.params, this.next, {this.clear = false});
  final SearchParams params;
  final String? next;
  final bool clear;

  @override
  List<Object?> get props => [params, next, clear];
}
