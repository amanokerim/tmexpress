part of 'start_bloc.dart';

abstract class StartState extends Equatable {
  const StartState();

  @override
  List<Object> get props => [];
}

class StartInitial extends StartState {}

class StartLoadInProgress extends StartState {}

class StartShowOnboarding extends StartState {}

class StartShowQuestionnaire extends StartState {}

class StartShowHome extends StartState {
  const StartShowHome({required this.tab});

  final int tab;

  List<Object> get props => [tab];
}

class StartShowTechnicalWorksScreen extends StartState {}

class StartShowUpdateScreen extends StartState {}

class StartShowNewVersionFlash extends StartState {
  const StartShowNewVersionFlash(this.newVersion);
  final String newVersion;

  @override
  List<Object> get props => [newVersion];
}

// class StartSetUpFCMListener extends StartState {
//   const StartSetUpFCMListener(this.fcmStream);
//   final Stream<FCMNotification> fcmStream;
// }
