part of 'media_bloc.dart';

abstract class MediaEvent extends Equatable {
  const MediaEvent();

  @override
  List<Object?> get props => [];
}

class MediaRequested extends MediaEvent {
  const MediaRequested({required this.next, required this.categoryId});
  final String? next;
  final int? categoryId;

  @override
  List<Object?> get props => [next, categoryId];
}
