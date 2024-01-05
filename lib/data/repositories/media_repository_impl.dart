import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../domain/errors/app_error.dart';
import '../../domain/repositories/media_repository.dart';
import '../../presentation/utils/constants.dart';
import '../error/exception_handler.dart';
import '../network/common_network.dart';
import '../network/response_models/media.dart';
import '../network/response_models/pagination.dart';

@LazySingleton(as: MediaRepository)
class MediaRepositoryImpl implements MediaRepository {
  MediaRepositoryImpl(
    this._exception,
    this._commonNetwork,
    this.favoritesBox,
  );

  final ExceptionHandler _exception;
  final CommonNetwork _commonNetwork;
  final Box<Map<dynamic, dynamic>> favoritesBox;

  @override
  Future<Either<AppError, Pagination<Media>>> fetchMediaList(
      String? next, int? categoryId) {
    return _exception.handle(
      () => _commonNetwork.fetchMediaList(_getOffset(next), kLimit, categoryId),
    );
  }

  String? _getOffset(String? next) {
    if (next != null) {
      final uri = Uri.parse(next);
      return uri.queryParameters['offset'];
    }
    return null;
  }
}
