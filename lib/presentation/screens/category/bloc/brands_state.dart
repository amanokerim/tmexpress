part of 'brands_bloc.dart';

abstract class BrandsState extends Equatable {
  const BrandsState();

  @override
  List<Object?> get props => [];
}

class BrandsInitial extends BrandsState {}

class BrandsLoadSuccess extends BrandsState {
  const BrandsLoadSuccess({
    required this.brands,
    required this.next,
  });
  final List<Brand> brands;
  final String? next;

  @override
  List<Object?> get props => [brands, next];
}

class BrandsLoadError extends BrandsState {
  const BrandsLoadError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
