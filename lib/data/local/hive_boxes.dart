import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/utils/constants.dart';

@lazySingleton
class HiveBoxes {
  HiveBoxes();

  static Future<void> init({String? subDir}) async {
    await Hive.initFlutter(subDir);
    await Hive.openBox<Map<dynamic, dynamic>>(kFavoritesBox);
    await Hive.openBox<dynamic>(kDataBox);
  }

  Box<dynamic> getBox(String boxName) => Hive.box(boxName);
}
