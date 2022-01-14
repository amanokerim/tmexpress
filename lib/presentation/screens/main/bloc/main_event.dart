part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class MainTabChanged extends MainEvent {
  const MainTabChanged({
    required this.index,
  });
  final int index;

  @override
  List<Object> get props => [index];
}
