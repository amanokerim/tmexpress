import 'package:dartz/dartz.dart';

import '../entities/interface/fcm_notification.dart';
import '../errors/failures.dart';

abstract class FCMRepository {
  Future<Either<Failure, bool>> deleteToken({String? token});

  Future<Either<Failure, bool>> registerToken({String? token});

  Stream<FCMNotification> getFCMStream();
}
