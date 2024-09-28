import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class _AppDebouncerOperation {
  _AppDebouncerOperation(this.timer, this.callback);

  final Timer timer;
  final VoidCallback callback;
}

class AppDebouncer {
  AppDebouncer._();

  static final Map<String, _AppDebouncerOperation> _operations = {};

  static void debounce({
    required String tag,
    required Duration duration,
    required VoidCallback callback,
  }) {
    _operations[tag]?.timer.cancel();
    _operations[tag] = _AppDebouncerOperation(
      Timer(duration, () {
        _operations[tag]?.timer.cancel();
        _operations.remove(tag);
        callback();
      }),
      callback,
    );
  }

  static Stream<T> blocTransformer<T>(
          Stream<T> events, Stream<T> Function(T) mapper) =>
      events
          .debounceTime(const Duration(milliseconds: 500))
          .asyncExpand(mapper);
}
