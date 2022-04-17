part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchRequested extends SearchEvent {
  const SearchRequested(this.query, this.next, {this.clear = false});
  final String query;
  final String? next;
  final bool clear;

  @override
  List<Object?> get props => [query, next, clear];
}
