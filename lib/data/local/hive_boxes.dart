import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/utils/constants.dart';

@lazySingleton
class HiveBoxes {
  HiveBoxes();

  static Future<void> init({String? subDir}) async {
    await Hive.initFlutter(subDir);
    for (final box in _boxes) {
      await Hive.openBox<dynamic>(box);
    }
  }

  Box<dynamic> getBox(String boxName) => Hive.box(boxName);
}

const _boxes = [kFavoritesBox, kDataBox];
