part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoadInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {
  const HomeLoadSuccess(this.home);
  final Home home;

  @override
  List<Object> get props => [home];
}

class HomeLoadError extends HomeState {
  const HomeLoadError(this.message, this.key);
  final String message;
  final Key key;

  @override
  List<Object> get props => [key];
}
