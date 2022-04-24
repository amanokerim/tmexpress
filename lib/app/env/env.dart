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

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  void _preCache() {
    final svgList = [
      'assets/illustrations/auth.svg',
      'assets/illustrations/empty.svg',
      'assets/illustrations/error.svg'
    ];
    Future.wait([
      for (var svg in svgList)
        precachePicture(
            ExactAssetPicture(SvgPicture.svgStringDecoder, svg), null),
      // TODO Precache
      // assets/icons/home.png
      // assets/icons/category.png
      // assets/icons/fire.png
      // assets/icons/basket.png
      // assets/icons/profile.png
    ]);
  }
}

enum EnvType { development, staging, production, unknown }
