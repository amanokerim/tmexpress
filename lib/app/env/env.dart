import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../firebase_options.dart';
import '../../main.dart';
import '../../presentation/bloc/app_bloc_observer.dart';
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
  String siteUrl = '';

  Future<dynamic> init() async {
    await runZonedGuarded<Future<void>>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        await configureInjection(Environment.prod);

        await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp]);
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light),
        );

        await _initFirebase();

        BlocOverrides.runZoned(
          () => runApp(DevicePreview(
            enabled: value.showAlice,
            builder: (context) => FlutterApp(this),
          )),
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
    await FirebaseAnalytics.instance.logAppOpen();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    final remoteConfig = RemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 30),
    ));
  }
}

enum EnvType { development, staging, production, unknown }
