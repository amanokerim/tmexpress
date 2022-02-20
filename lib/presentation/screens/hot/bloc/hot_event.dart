part of 'hot_bloc.dart';

abstract class HotEvent extends Equatable {
  const HotEvent();

  @override
  List<Object?> get props => [];
}

class HotRequested extends HotEvent {
  const HotRequested({required this.next});
  final String? next;

  @override
  List<Object?> get props => [next];
}
