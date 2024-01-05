part of 'media_category_cubit.dart';

class MediaCategoryState {
  const MediaCategoryState();
}

class MediaCategoryInitial extends MediaCategoryState {}

class MediaCategorySuccess extends MediaCategoryState {
  const MediaCategorySuccess(this.categories);
  final List<MediaCategory> categories;
}

class MediaCategoryError extends MediaCategoryState {
  const MediaCategoryError(this.message);
  final String message;
}
