part of 'media_cubit.dart';

class MediaState {
  const MediaState();
}

class MediaLoading extends MediaState {}

class MediaSuccess extends MediaState {
  MediaSuccess(this.media);
  final Media media;
}

class MediaError extends MediaState {
  const MediaError(this.message);

  final String message;
}
