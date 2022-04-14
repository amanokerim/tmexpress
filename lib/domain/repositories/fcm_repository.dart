import 'package:dartz/dartz.dart';

import '../entities/interface/fcm_notification.dart';
import '../errors/app_error.dart';

abstract class FCMRepository {
  Future<Either<AppError, bool>> deleteToken({String? token});

  Future<Either<AppError, bool>> registerToken({String? token});

  Stream<FCMNotification> getFCMStream();
}
