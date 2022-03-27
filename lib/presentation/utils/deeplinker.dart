import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'constants.dart';

class DeepLinker {
  const DeepLinker._();

  static void handle(
      BuildContext context, PendingDynamicLinkData dynamicLinkData) {
    final referral = dynamicLinkData.link.queryParameters['referral'];
    final type = dynamicLinkData.link.path;

    print('referral=$referral');

    if (referral != null) {
      if (type == kDynamicLinkRegister) {
        print('REGISTER');
      } else if (type.startsWith(kDynamicLinkProduct)) {
        final productId = int.tryParse(type.split('/').last);
        print('PRODUCT');
        print(productId);
      }
    }
  }

  static Future<void> shareShortLink(String link) async {
    final parameters = DynamicLinkParameters(
        link: Uri.parse(link),
        uriPrefix: kDynamicLinkPrefix,
        androidParameters: const AndroidParameters(packageName: kPackage),
        iosParameters: const IOSParameters(bundleId: kPackage));
    final shortLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    await Share.share(shortLink.shortUrl.toString());
  }
}
