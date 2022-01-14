part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailLoadInProgress extends DetailState {}

class DetailLoadSuccess extends DetailState {
  const DetailLoadSuccess(this.product);
  final Product product;

  @override
  List<Object> get props => [product];
}

class DetailLoadError extends DetailState {
  const DetailLoadError(this.message, this.key);
  final String message;
  final Key key;

  @override
  List<Object> get props => [message, key];
}
