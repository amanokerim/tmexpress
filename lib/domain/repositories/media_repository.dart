import 'package:dartz/dartz.dart';

import '../../data/network/response_models/media.dart';
import '../../data/network/response_models/pagination.dart';
import '../errors/app_error.dart';

abstract class MediaRepository {
  Future<Either<AppError, Pagination<Media>>> fetchMediaList(
      String? next, int? categoryId);
}
