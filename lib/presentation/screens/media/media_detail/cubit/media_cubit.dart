import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/network/response_models/media.dart';
import '../../../../../domain/repositories/media_repository.dart';

part 'media_state.dart';

@injectable
class MediaCubit extends Cubit<MediaState> {
  MediaCubit(this.repository) : super(MediaLoading());
  final MediaRepository repository;

  Future<void> load(int id) async {
    emit(MediaLoading());
    final r = await repository.fetchMedia(id);
    emit(r.fold(
      (l) => MediaError(l.message),
      MediaSuccess.new,
    ));
  }
}
