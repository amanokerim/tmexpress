import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as pp;

import '../../firebase_options.dart';
import '../../main.dart';
import '../../presentation/bloc/app_bloc_observer.dart';
import '../../presentation/utils/constants.dart';
import '../injection/injection.dart';

class Env {
  Env() {
    value = this;
  }

  static late Env value;
  String baseUrl = '';
  bool showAlice = false;
  bool writeLogs = false;
  EnvType envType = EnvType.unknown;
  PendingDynamicLinkData? dynamicLinkData;
  String cacheDir = '';

  Future<dynamic> init() async {
    await runZonedGuarded<Future<void>>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        cacheDir = (await pp.getTemporaryDirectory()).path;
        await configureInjection(Environment.prod);

        await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp]);
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light),
        );
        await _initFirebase();

        await Hive.initFlutter();
        await Hive.openBox<Map<dynamic, dynamic>>(kFavoritesBox);
        await Hive.openBox<String>(kDataBox);

        _preCache();

        BlocOverrides.runZoned(
          // () => runApp(DevicePreview(
          //   enabled: value.showAlice,
          //   builder: (context) => FlutterApp(this),
          // )),
          () => runApp(FlutterApp(this)),
          blocObserver: AppBlocObserver(),
        );
      },
      (dynamic error, StackTrace? stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack),
    );
  }

  Future<void> _initFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        Env.value.envType != EnvType.development);
    // await FirebaseAnalytics.instance.logAppOpen();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    // final remoteConfig = RemoteConfig.instance;
    // await remoteConfig.setConfigSettings(RemoteConfigSettings(
    //   fetchTimeout: const Duration(seconds: 10),
    //   minimumFetchInterval: const Duration(seconds: 30),
    // ));
  }

  void _preCache() {
    Future.wait([
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/illustrations/auth.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/illustrations/empty.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/illustrations/error.svg'),
          null),
    ]);
  }
}

enum EnvType { development, staging, production, unknown }
