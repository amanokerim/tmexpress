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
