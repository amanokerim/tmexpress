import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/network/response_models/media.dart';
import '../../../../domain/repositories/media_repository.dart';

part 'media_event.dart';
part 'media_state.dart';

@injectable
class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaBloc(this.repository) : super(MediaInitial()) {
    on<MediaRequested>((event, emit) async {
      final r = await repository.fetchMediaList(event.next, event.categoryId);
      emit(r.fold(
        (error) => MediaLoadError(error.message),
        (pagination) => MediaLoadSuccess(
          media: pagination.results,
          next: pagination.next,
        ),
      ));
    });
  }

  final MediaRepository repository;
}
