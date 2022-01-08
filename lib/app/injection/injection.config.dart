// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../data/error/error_mapper.dart' as _i6;
import '../../data/error/exception_handler.dart' as _i7;
import '../../data/local/preferences.dart' as _i11;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i9;
import '../../data/network/auth_interceptor.dart' as _i17;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i5;
import '../../data/repositories/preferences_repository_impl.dart' as _i13;
import '../../data/repositories/product_repository_impl.dart' as _i15;
import '../../domain/repositories/preferences_repository.dart' as _i12;
import '../../domain/repositories/product_repository.dart' as _i14;
import '../../domain/usecases/fetch_products_usecase.dart' as _i18;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i19;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i20;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i21;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i22;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i16;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i8;
import '../../presentation/screens/product/bloc/product_bloc.dart' as _i23;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i24;
import 'register_module.dart' as _i25; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Alice>(() => registerModule.alice);
  gh.lazySingleton<_i4.AuthNetwork>(() => registerModule.authNetwork);
  gh.lazySingleton<_i5.CommonNetwork>(() => registerModule.commonNetwork);
  gh.lazySingleton<_i6.ErrorMapper>(() => _i6.ErrorMapper());
  gh.lazySingleton<_i7.ExceptionHandler>(
      () => _i7.ExceptionHandler(get<_i6.ErrorMapper>()));
  gh.factory<_i8.HomeBloc>(() => _i8.HomeBloc());
  gh.lazySingleton<_i9.ProductResponseMapper>(
      () => _i9.ProductResponseMapper());
  await gh.lazySingletonAsync<_i10.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i11.Preferences>(
      () => _i11.Preferences(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i12.PreferencesRepository>(() =>
      _i13.PreferencesRepositoryImpl(
          get<_i6.ErrorMapper>(), get<_i11.Preferences>()));
  gh.lazySingleton<_i14.ProductRepository>(() => _i15.ProductRepositoryImpl(
      get<_i5.CommonNetwork>(),
      get<_i9.ProductResponseMapper>(),
      get<_i7.ExceptionHandler>()));
  gh.lazySingleton<_i16.SetPreferenceUseCase>(
      () => _i16.SetPreferenceUseCase(get<_i12.PreferencesRepository>()));
  gh.lazySingleton<_i17.AuthInterceptor>(
      () => _i17.AuthInterceptor(get<_i11.Preferences>()));
  gh.lazySingleton<_i18.FetchProductsUseCase>(
      () => _i18.FetchProductsUseCase(get<_i14.ProductRepository>()));
  gh.lazySingleton<_i19.GetBoolPreferenceUseCase>(
      () => _i19.GetBoolPreferenceUseCase(get<_i12.PreferencesRepository>()));
  gh.lazySingleton<_i20.GetDoublePreferenceUseCase>(
      () => _i20.GetDoublePreferenceUseCase(get<_i12.PreferencesRepository>()));
  gh.lazySingleton<_i21.GetIntPreferenceUseCase>(
      () => _i21.GetIntPreferenceUseCase(get<_i12.PreferencesRepository>()));
  gh.lazySingleton<_i22.GetStringPreferenceUseCase>(
      () => _i22.GetStringPreferenceUseCase(get<_i12.PreferencesRepository>()));
  gh.factory<_i23.ProductBloc>(
      () => _i23.ProductBloc(get<_i18.FetchProductsUseCase>()));
  gh.factory<_i24.StartBloc>(() => _i24.StartBloc(
      get<_i19.GetBoolPreferenceUseCase>(),
      get<_i22.GetStringPreferenceUseCase>(),
      get<_i16.SetPreferenceUseCase>()));
  return get;
}

class _$RegisterModule extends _i25.RegisterModule {}
