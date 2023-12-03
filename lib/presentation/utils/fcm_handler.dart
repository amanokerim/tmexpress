// import 'dart:async';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// import '../../app/generated/l10n.dart';
// import '../../domain/entities/fcm_notification.dart';
// import '../widgets/app_confirm_dialog.dart';
// import 'app_flash.dart';
// import 'navigation_helper.dart';

// class FCMHandler {
//   late StreamSubscription<FCMNotification> _subscription;

//   Future<void> init(
//       BuildContext context, Stream<FCMNotification> fcmStream) async {
//     final status = await FirebaseMessaging.instance
//         .requestPermission(alert: true, sound: true, badge: true);
//     if (status.authorizationStatus == AuthorizationStatus.denied) {
//       await AppFlash.bigToast(
//           context: context, message: S.current.youCantReceiveNotifications);
//     }

//     _subscription = fcmStream.listen((notification) async {
//       bool? navigate;
//       if (notification.isForeground) {
//         final n = notification.message.notification;
//         if (n != null) {
//           navigate = await showDialog<bool>(
//             context: context,
//             builder: (_) => AppDialog(
//               title: n.title,
//               content: n.body ?? '',
//               positiveButtonLabel: S.current.open,
//             ),
//           );
//         }
//       }
//       if (navigate == true || notification.isBackground) {
//         final pageType = notification.message.data['page'];
//         final id = notification.message.data['id'];
//         NavigationHelper.navigateToPTS(context, pageType, id);
//       }
//     });
//   }

//   void dispose() {
//     _subscription.cancel();
//   }
// }
