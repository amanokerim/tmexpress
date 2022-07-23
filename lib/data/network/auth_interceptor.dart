import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/preferences_repository.dart';

@lazySingleton
class AuthInterceptor extends InterceptorsWrapper {
  AuthInterceptor(this._preferencesRepository);
  final PreferencesRepository _preferencesRepository;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Authorization': 'Bearer ${_preferencesRepository.getJwt()}',
    });
    handler.next(options);
  }
}
