// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../data/error/error_mapper.dart' as _i6;
import '../../data/error/exception_handler.dart' as _i7;
import '../../data/local/preferences.dart' as _i12;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i17;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i11;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i10;
import '../../data/network/auth_interceptor.dart' as _i16;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i5;
import '../../data/repositories/category_repository_impl.dart' as _i24;
import '../../data/repositories/preferences_repository_impl.dart' as _i14;
import '../../domain/repositories/category_repository.dart' as _i23;
import '../../domain/repositories/preferences_repository.dart' as _i13;
import '../../domain/usecases/category/fetch_categories_usecase.dart' as _i25;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i18;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i19;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i20;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i21;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i15;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i26;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i8;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i22;
import 'register_module.dart' as _i27; // ignore_for_file: unnecessary_lambdas

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
  await gh.lazySingletonAsync<_i9.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i10.SubcategoryResponseMapper>(
      () => _i10.SubcategoryResponseMapper());
  gh.lazySingleton<_i11.GroupResponseMapper>(
      () => _i11.GroupResponseMapper(get<_i10.SubcategoryResponseMapper>()));
  gh.lazySingleton<_i12.Preferences>(
      () => _i12.Preferences(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i13.PreferencesRepository>(() =>
      _i14.PreferencesRepositoryImpl(
          get<_i6.ErrorMapper>(), get<_i12.Preferences>()));
  gh.lazySingleton<_i15.SetPreferenceUseCase>(
      () => _i15.SetPreferenceUseCase(get<_i13.PreferencesRepository>()));
  gh.lazySingleton<_i16.AuthInterceptor>(
      () => _i16.AuthInterceptor(get<_i12.Preferences>()));
  gh.lazySingleton<_i17.CategoryResponseMapper>(
      () => _i17.CategoryResponseMapper(get<_i11.GroupResponseMapper>()));
  gh.lazySingleton<_i18.GetBoolPreferenceUseCase>(
      () => _i18.GetBoolPreferenceUseCase(get<_i13.PreferencesRepository>()));
  gh.lazySingleton<_i19.GetDoublePreferenceUseCase>(
      () => _i19.GetDoublePreferenceUseCase(get<_i13.PreferencesRepository>()));
  gh.lazySingleton<_i20.GetIntPreferenceUseCase>(
      () => _i20.GetIntPreferenceUseCase(get<_i13.PreferencesRepository>()));
  gh.lazySingleton<_i21.GetStringPreferenceUseCase>(
      () => _i21.GetStringPreferenceUseCase(get<_i13.PreferencesRepository>()));
  gh.factory<_i22.StartBloc>(() => _i22.StartBloc(
      get<_i18.GetBoolPreferenceUseCase>(),
      get<_i21.GetStringPreferenceUseCase>(),
      get<_i15.SetPreferenceUseCase>()));
  gh.lazySingleton<_i23.CategoryRepository>(() => _i24.CategoryRepositoryImpl(
      get<_i7.ExceptionHandler>(),
      get<_i5.CommonNetwork>(),
      get<_i17.CategoryResponseMapper>()));
  gh.lazySingleton<_i25.FetchProductsUseCase>(
      () => _i25.FetchProductsUseCase(get<_i23.CategoryRepository>()));
  gh.factory<_i26.CategoryBloc>(
      () => _i26.CategoryBloc(get<_i25.FetchProductsUseCase>()));
  return get;
}

class _$RegisterModule extends _i27.RegisterModule {}
