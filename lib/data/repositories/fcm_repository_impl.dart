import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

import '../../app/env/env.dart';
import '../../domain/entities/interface/fcm_notification.dart';
import '../../domain/errors/app_error.dart';
import '../../domain/repositories/fcm_repository.dart';
import '../error/exception_handler.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

@LazySingleton(as: FCMRepository)
class FCMRepositoryImpl extends FCMRepository {
  FCMRepositoryImpl(this._exception) {
    _initializeListeners();
  }

  final ExceptionHandler _exception;

  final StreamController<FCMNotification> _fcmStreamController =
      StreamController.broadcast(sync: true);

  Future<void> _initializeListeners() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((message) async {
      _fcmStreamController.add(FCMNotification(
          message: message, type: FCMNotificationType.foreground));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      _fcmStreamController.add(FCMNotification(
        message: message,
        type: FCMNotificationType.background,
      ));
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null && token != newToken) await deleteToken(token: token);

      if (Env.value.writeLogs) {
        print('*** New token = $newToken');
      }
      await registerToken(token: newToken);
    });

    final token = await FirebaseMessaging.instance.getToken();
    if (Env.value.writeLogs) print('*** Token $token');
  }

  /// It registers token when user authorized. Call this when authorization
  /// is complete and when token was changed from Firebase.
  @override
  Future<Either<AppError, bool>> registerToken({String? token}) async {
    return _exception.handle(() async {
      // final jwt = _preferences.getJwt();
      // if (jwt == null || jwt.isEmpty) return const Right(true);

      // token ??= await FirebaseMessaging.instance.getToken();
      // final platform = Platform.isIOS ? 'ios' : 'android';
      // if (token != null) {
      // await _preferences.setPreference(pFCMToken, token);
      // await _authNetwork.registerFCMToken(token: token, platform: platform);
      // }
      // if (Env.value.writeLogs) {
      //   print('== token registered ==');
      //   print(token);
      // }
      return true;
    });
  }

  /// If token is not passed, gets it from prefs. Call it when user signs out.
  @override
  Future<Either<AppError, bool>> deleteToken({String? token}) async {
    return _exception.handle(() async {
      // token ??= _preferences.getStringPreference(pFCMToken);
      // if (token != null) await _authNetwork.deleteFCMToken(token: token);
      // if (Env.value.writeLogs) {
      //   print('== token deleted ==');
      //   print(token);
      // }
      return true;
    });
  }

  @override
  Stream<FCMNotification> getFCMStream() {
    return _fcmStreamController.stream;
  }
}
