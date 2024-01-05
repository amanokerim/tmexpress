import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/network/response_models/media.dart';
import '../../../../domain/repositories/media_repository.dart';

part 'media_list_event.dart';
part 'media_list_state.dart';

@injectable
class MediaListBloc extends Bloc<MediaListEvent, MediaListState> {
  MediaListBloc(this.repository) : super(MediaInitial()) {
    on<MediaListRequested>((event, emit) async {
      final r = await repository.fetchMediaList(event.next, event.categoryId);
      emit(r.fold(
        (error) => MediaListLoadError(error.message),
        (pagination) => MediaListLoadSuccess(
          media: pagination.results,
          next: pagination.next,
          clear: event.clear,
        ),
      ));
    });
  }

  final MediaRepository repository;
}
