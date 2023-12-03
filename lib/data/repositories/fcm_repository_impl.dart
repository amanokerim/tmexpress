// import 'dart:async';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:injectable/injectable.dart';

// import '../../domain/entities/fcm_notification.dart';
// import '../../domain/repositories/fcm_repository.dart';

// @LazySingleton(as: FCMRepository)
// class FCMRepositoryImpl extends FCMRepository {
//   FCMRepositoryImpl() {
//     _initializeListeners();
//   }

//   final StreamController<FCMNotification> _fcmStreamController =
//       StreamController.broadcast(sync: true);

//   Future<void> _initializeListeners() async {
//     FirebaseMessaging.onMessage.listen((message) async {
//       _fcmStreamController.add(FCMNotification(
//           message: message, type: FCMNotificationType.foreground));
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((message) async {
//       _fcmStreamController.add(
//         FCMNotification(message: message, type: 
// FCMNotificationType.background),
//       );
//     });
//   }

//   @override
//   Stream<FCMNotification> getFCMStream() {
//     return _fcmStreamController.stream;
//   }
// }
