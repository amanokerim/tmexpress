import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/auth_interceptor.dart';
import '../../data/network/auth_network.dart';
import '../../data/network/common_network.dart';
import '../../presentation/utils/constants.dart';
import '../env/env.dart';
import 'injection.dart';

@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Alice get alice => Alice(
        showNotification: true,
        showInspectorOnShake: Env.value.showAlice,
      );

  @lazySingleton
  Box<Map<dynamic, dynamic>> get favoritesBox => Hive.box(kFavoritesBox);

  @lazySingleton
  CacheOptions get cacheOption => CacheOptions(
      store: HiveCacheStore(null),
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: [],
      maxStale: const Duration(seconds: 10));

  @lazySingleton
  CommonNetwork get commonNetwork {
    final dio = Dio(BaseOptions(contentType: 'application/json'))
      ..interceptors.add(getIt<Alice>().getDioInterceptor())
      ..interceptors.add(DioCacheInterceptor(options: getIt<CacheOptions>()));
    return CommonNetwork(dio, baseUrl: Env.value.baseUrl);
  }

  @lazySingleton
  AuthNetwork get authNetwork {
    final dio = Dio(BaseOptions(contentType: 'application/json'));
    dio.interceptors.add(getIt<Alice>().getDioInterceptor());
    dio.interceptors.add(getIt<AuthInterceptor>());
    return AuthNetwork(dio, baseUrl: Env.value.baseUrl);
  }
}
