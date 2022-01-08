part of 'start_bloc.dart';

abstract class StartState extends Equatable {
  const StartState();

  @override
  List<Object> get props => [];
}

class StartInitial extends StartState {}

class StartLoadInProgress extends StartState {}

class StartShowOnboarding extends StartState {}

class StartShowAuth extends StartState {}

class StartShowQuestionnaire extends StartState {}

class StartShowHome extends StartState {
  const StartShowHome({required this.tab});

  final int tab;

  List<Object> get props => [tab];
}

class StartShowTechnicalWorksScreen extends StartState {}

class StartShowUpdateScreen extends StartState {}

class StartShowNewVersioFlash extends StartState {
  const StartShowNewVersioFlash(this.newVersion);
  final String newVersion;

  @override
  List<Object> get props => [newVersion];
}
