// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../../data/error/error_mapper.dart' as _i7;
import '../../data/error/exception_handler.dart' as _i8;
import '../../data/local/preferences.dart' as _i15;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i20;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i14;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i10;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i12;
import '../../data/mappers/response_mappers/tag_respose_mapper.dart' as _i13;
import '../../data/network/auth_interceptor.dart' as _i19;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i6;
import '../../data/repositories/preferences_repository_impl.dart' as _i17;
import '../../data/repositories/product_repository_impl.dart' as _i26;
import '../../domain/repositories/preferences_repository.dart' as _i16;
import '../../domain/repositories/product_repository.dart' as _i25;
import '../../domain/usecases/fetch_categories_usecase.dart' as _i28;
import '../../domain/usecases/fetch_home_usecase.dart' as _i29;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i21;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i22;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i23;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i24;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i18;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i31;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i30;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i9;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i27;
import 'register_module.dart' as _i32; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Alice>(() => registerModule.alice);
  gh.lazySingleton<_i4.AuthNetwork>(() => registerModule.authNetwork);
  gh.lazySingleton<_i5.BannerResponseMapper>(() => _i5.BannerResponseMapper());
  gh.lazySingleton<_i6.CommonNetwork>(() => registerModule.commonNetwork);
  gh.lazySingleton<_i7.ErrorMapper>(() => _i7.ErrorMapper());
  gh.lazySingleton<_i8.ExceptionHandler>(
      () => _i8.ExceptionHandler(get<_i7.ErrorMapper>()));
  gh.factory<_i9.MainBloc>(() => _i9.MainBloc());
  gh.lazySingleton<_i10.ProductMiniResponseMapper>(
      () => _i10.ProductMiniResponseMapper());
  await gh.lazySingletonAsync<_i11.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i12.SubcategoryResponseMapper>(
      () => _i12.SubcategoryResponseMapper());
  gh.lazySingleton<_i13.TagResponseMapper>(() => _i13.TagResponseMapper());
  gh.lazySingleton<_i14.GroupResponseMapper>(
      () => _i14.GroupResponseMapper(get<_i12.SubcategoryResponseMapper>()));
  gh.lazySingleton<_i15.Preferences>(
      () => _i15.Preferences(get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i16.PreferencesRepository>(() =>
      _i17.PreferencesRepositoryImpl(
          get<_i7.ErrorMapper>(), get<_i15.Preferences>()));
  gh.lazySingleton<_i18.SetPreferenceUseCase>(
      () => _i18.SetPreferenceUseCase(get<_i16.PreferencesRepository>()));
  gh.lazySingleton<_i19.AuthInterceptor>(
      () => _i19.AuthInterceptor(get<_i15.Preferences>()));
  gh.lazySingleton<_i20.CategoryResponseMapper>(
      () => _i20.CategoryResponseMapper(get<_i14.GroupResponseMapper>()));
  gh.lazySingleton<_i21.GetBoolPreferenceUseCase>(
      () => _i21.GetBoolPreferenceUseCase(get<_i16.PreferencesRepository>()));
  gh.lazySingleton<_i22.GetDoublePreferenceUseCase>(
      () => _i22.GetDoublePreferenceUseCase(get<_i16.PreferencesRepository>()));
  gh.lazySingleton<_i23.GetIntPreferenceUseCase>(
      () => _i23.GetIntPreferenceUseCase(get<_i16.PreferencesRepository>()));
  gh.lazySingleton<_i24.GetStringPreferenceUseCase>(
      () => _i24.GetStringPreferenceUseCase(get<_i16.PreferencesRepository>()));
  gh.lazySingleton<_i25.ProductRepository>(() => _i26.ProductRepositoryImpl(
      get<_i8.ExceptionHandler>(),
      get<_i6.CommonNetwork>(),
      get<_i20.CategoryResponseMapper>(),
      get<_i5.BannerResponseMapper>(),
      get<_i13.TagResponseMapper>()));
  gh.factory<_i27.StartBloc>(() => _i27.StartBloc(
      get<_i21.GetBoolPreferenceUseCase>(),
      get<_i24.GetStringPreferenceUseCase>(),
      get<_i18.SetPreferenceUseCase>()));
  gh.lazySingleton<_i28.FetchCategoriesUseCase>(
      () => _i28.FetchCategoriesUseCase(get<_i25.ProductRepository>()));
  gh.lazySingleton<_i29.FetchHomeUseCase>(
      () => _i29.FetchHomeUseCase(get<_i25.ProductRepository>()));
  gh.factory<_i30.HomeBloc>(() => _i30.HomeBloc(get<_i29.FetchHomeUseCase>()));
  gh.factory<_i31.CategoryBloc>(
      () => _i31.CategoryBloc(get<_i28.FetchCategoriesUseCase>()));
  return get;
}

class _$RegisterModule extends _i32.RegisterModule {}
