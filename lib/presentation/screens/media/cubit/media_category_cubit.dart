import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../data/network/response_models/media_category.dart';
import '../../../../domain/repositories/media_repository.dart';

part 'media_category_state.dart';

@injectable
class MediaCategoryCubit extends Cubit<MediaCategoryState> {
  MediaCategoryCubit(this.repository) : super(MediaCategoryInitial());
  final MediaRepository repository;

  Future<void> load() async {
    emit(MediaCategoryInitial());
    final r = await repository.fetchMediaCategories();

    emit(r.fold(
      (e) => MediaCategoryError(e.message),
      (c) => MediaCategorySuccess([
        MediaCategory(id: -1, titleTm: S.current.all, titleRu: '', icon: ''),
        ...c
      ]),
    ));
  }
}
