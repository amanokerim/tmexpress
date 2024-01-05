part of 'media_list_bloc.dart';

abstract class MediaListState extends Equatable {
  const MediaListState();

  @override
  List<Object?> get props => [];
}

class MediaInitial extends MediaListState {}

class MediaListLoadSuccess extends MediaListState {
  const MediaListLoadSuccess({
    required this.media,
    required this.next,
    this.clear = false,
  });
  final List<Media> media;
  final String? next;
  final bool clear;

  @override
  List<Object?> get props => [media, next, clear];
}

class MediaListLoadError extends MediaListState {
  const MediaListLoadError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
