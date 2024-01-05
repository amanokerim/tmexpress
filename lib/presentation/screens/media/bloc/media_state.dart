part of 'media_bloc.dart';

abstract class MediaState extends Equatable {
  const MediaState();

  @override
  List<Object?> get props => [];
}

class MediaInitial extends MediaState {}

class MediaLoadSuccess extends MediaState {
  const MediaLoadSuccess({
    required this.media,
    required this.next,
  });
  final List<Media> media;
  final String? next;

  @override
  List<Object?> get props => [media, next];
}

class MediaLoadError extends MediaState {
  const MediaLoadError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
