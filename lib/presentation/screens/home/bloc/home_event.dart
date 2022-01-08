part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeTabChanged extends HomeEvent {
  const HomeTabChanged({
    required this.index,
  });
  final int index;

  @override
  List<Object> get props => [index];
}
