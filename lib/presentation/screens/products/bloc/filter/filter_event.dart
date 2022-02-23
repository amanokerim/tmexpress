part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class FilterSizesRequested extends FilterEvent {
  const FilterSizesRequested(this.subcategoryId);
  final int subcategoryId;

  @override
  List<Object> get props => [subcategoryId];
}

class FilterSizeToggled extends FilterEvent {
  const FilterSizeToggled(this.size);
  final Size size;

  @override
  List<Object> get props => [size];
}

class FilterDiscountedToggled extends FilterEvent {}

class FilterAllSizesSelected extends FilterEvent {}
