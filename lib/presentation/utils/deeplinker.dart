// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:share_plus/share_plus.dart';

// import '../screens/detail/detail_page.dart';
// import '../screens/main/bloc/main_bloc.dart';
// import '../screens/profile/bloc/profile_bloc.dart';
// import 'app_flash.dart';
// import 'constants.dart';

// class DeepLinker {
//   const DeepLinker._();

//   static Future<void> init(BuildContext context) async {
//     // TODO Test deep-link with inactive app
//     final dynamicLinkData =
//         await FirebaseDynamicLinks.instance.getInitialLink();

//     if (dynamicLinkData != null) {
//       DeepLinker.handle(context, dynamicLinkData);
//     }
//     FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
//       DeepLinker.handle(context, dynamicLinkData);
//     });
//     context.read<ProfileBloc>().add(ProfileStarted());
//   }

//   static void handle(
//       BuildContext context, PendingDynamicLinkData dynamicLinkData) {
//     final referral = dynamicLinkData.link.queryParameters['referral'];
//     final type = dynamicLinkData.link.path;

//     if (referral != null) {
//       final box = Hive.box<dynamic>(kDataBox);
//       if (type == kDynamicLinkRegister) {
//         box.put(kRegisterReferral, referral);
//         context.read<MainBloc>().add(const MainTabChanged(index: 4));
//         AppFlash.bigToast(
//             context: context, message: 'Register Referral id = $referral');
//       } else if (type.startsWith(kDynamicLinkProduct)) {
//         final productId = int.tryParse(type.split('/').last);
//         if (productId != null) {
//           box
//             ..put(kProductReferralUserId, referral)
//             ..put(kProductReferralDate, DateTime.now().toIso8601String());
//           Navigator.of(context).push(
//               MaterialPageRoute<void>(builder: (_) => 
// DetailPage(productId)));
//           AppFlash.bigToast(
//               context: context, message: 'Product Referral id = $referral');
//         }
//       }
//     }
//   }

//   static Future<void> shareShortLink(String link) async {
//     final parameters = DynamicLinkParameters(
//         link: Uri.parse(link),
//         uriPrefix: kDynamicLinkPrefix,
//         androidParameters: const AndroidParameters(packageName: kPackage),
//         iosParameters: const IOSParameters(bundleId: kPackage));
//     final shortLink =
//         await FirebaseDynamicLinks.instance.buildShortLink(parameters);
//     await Share.share(shortLink.shortUrl.toString());
//   }
// }
