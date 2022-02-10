import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../local/preferences.dart';

@lazySingleton
class AuthInterceptor extends InterceptorsWrapper {
  AuthInterceptor(this._preferences);
  final Preferences _preferences;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Authorization': 'Bearer ${_preferences.getJwt()}',
    });
    handler.next(options);
  }
}
