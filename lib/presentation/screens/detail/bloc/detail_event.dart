part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DetailRequested extends DetailEvent {
  const DetailRequested(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}

class DetailSizeChanged extends DetailEvent {
  const DetailSizeChanged(this.size);
  final Size size;

  @override
  List<Object> get props => [size];
}

class DetailColorChanged extends DetailEvent {
  const DetailColorChanged(this.color);
  final List<Image> color;

  @override
  List<Object> get props => [color];
}

class DetailProductLikeToggled extends DetailEvent {}

class DetailProductShared extends DetailEvent {}
