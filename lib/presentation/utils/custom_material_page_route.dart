import 'package:flutter/material.dart';

/// On iOS swipe to back not works when will pop used in that page.
/// This widget solves problem below:
class CustomMaterialPageRoute extends MaterialPageRoute<dynamic> {
  CustomMaterialPageRoute({
    required super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
  });

  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }
}
