part of 'start_bloc.dart';

abstract class StartEvent extends Equatable {
  const StartEvent();

  @override
  List<Object> get props => [];
}

class StartRemoteConfigRequested extends StartEvent {}

class StartInitialized extends StartEvent {}

class StartOnboardingComplete extends StartEvent {}

class StartNavigatedToHome extends StartEvent {
  const StartNavigatedToHome({this.tab = 0});
  final int tab;

  List<Object> get props => [tab];
}

class StartNavigatedToQuestionnaire extends StartEvent {}

class StartAuthErrorOcurred extends StartEvent {}

class StartSignedOut extends StartEvent {}

class StartJwtRefresh extends StartEvent {
  const StartJwtRefresh({required this.lastEvent});
  final StartEvent lastEvent;

  List<Object> get props => [lastEvent];
}
