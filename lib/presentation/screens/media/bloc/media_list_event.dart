part of 'media_list_bloc.dart';

abstract class MediaListEvent extends Equatable {
  const MediaListEvent();

  @override
  List<Object?> get props => [];
}

class MediaListRequested extends MediaListEvent {
  const MediaListRequested({
    required this.next,
    required this.categoryId,
    this.clear = false,
  });
  final String? next;
  final int? categoryId;
  final bool clear;

  @override
  List<Object?> get props => [next, categoryId, clear];
}
