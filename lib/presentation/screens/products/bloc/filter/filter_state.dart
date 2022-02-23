part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}

class FilterLoad extends FilterState {}

class FilterError extends FilterState {
  const FilterError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

class FilterSuccess extends FilterState {
  const FilterSuccess({
    required this.isDiscounted,
    required this.sizes,
    required this.key,
  });

  final bool isDiscounted;
  final List<Size> sizes;
  final bool key;

  @override
  List<Object?> get props => [key];
}
