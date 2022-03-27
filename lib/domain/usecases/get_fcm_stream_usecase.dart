import 'package:injectable/injectable.dart';

import '../entities/interface/fcm_notification.dart';
import '../repositories/fcm_repository.dart';

@lazySingleton
class GetFCMStreamUseCase {
  GetFCMStreamUseCase(this._fcmRepository);
  final FCMRepository _fcmRepository;

  Stream<FCMNotification> call() => _fcmRepository.getFCMStream();
}
