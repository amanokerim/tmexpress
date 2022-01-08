import 'package:flutter/material.dart';

/// On iOS swipe to back not works when will pop used in that page.
/// This widget solves problem below:
class CustomMaterialPageRoute extends MaterialPageRoute<dynamic> {
  CustomMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }
}
