part of 'hot_bloc.dart';

abstract class HotEvent {
  const HotEvent();
}

class HotRequested extends HotEvent {
  const HotRequested(this.page);
  final String page;
}
