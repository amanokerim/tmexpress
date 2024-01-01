import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as pp;

import '../../data/local/hive_boxes.dart';
import '../../main.dart';
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
  // PendingDynamicLinkData? dynamicLinkData;
  String cacheDir = '';

  Future<dynamic> init() async {
    print('WidgetsFlutterBinding.ensureInitialized();');
    WidgetsFlutterBinding.ensureInitialized();

    cacheDir = (await pp.getTemporaryDirectory()).path;
    configureDependencies();
    print('configureDependencies();');

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light),
    );

    await HiveBoxes.init();

    _preCache();

    runApp(FlutterApp(this));

    // BlocOverrides.runZoned(
    //   // () => runApp(DevicePreview(
    //   //   enabled: value.showAlice,
    //   //   builder: (context) => FlutterApp(this),
    //   // )),
    //   () => runApp(FlutterApp(this)),
    //   blocObserver: AppBlocObserver(),
    // );
  }

  // Future<void> _initFirebase() async {
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform);
  // }

  void _preCache() {
    // final svgList = [
    //   'assets/illustrations/auth.svg',
    //   'assets/illustrations/empty.svg',
    //   'assets/illustrations/error.svg'
    // ];
    // Future.wait([
    //   for (var svg in svgList)
    //     precachePicture(
    //         ExactAssetPicture(SvgPicture.svgStringDecoder, svg), null),
    //   // TODO Precache
    //   // assets/icons/home.png
    //   // assets/icons/category.png
    //   // assets/icons/fire.png
    //   // assets/icons/basket.png
    //   // assets/icons/profile.png
    // ]);
  }
}

enum EnvType { development, staging, production, unknown }
