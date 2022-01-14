// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../../data/error/error_mapper.dart' as _i7;
import '../../data/error/exception_handler.dart' as _i8;
import '../../data/local/preferences.dart' as _i16;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i21;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i15;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i10;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i11;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i13;
import '../../data/mappers/response_mappers/tag_respose_mapper.dart' as _i14;
import '../../data/network/auth_interceptor.dart' as _i20;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i6;
import '../../data/repositories/preferences_repository_impl.dart' as _i18;
import '../../data/repositories/product_repository_impl.dart' as _i27;
import '../../domain/repositories/preferences_repository.dart' as _i17;
import '../../domain/repositories/product_repository.dart' as _i26;
import '../../domain/usecases/fetch_categories_usecase.dart' as _i29;
import '../../domain/usecases/fetch_home_usecase.dart' as _i30;
import '../../domain/usecases/fetch_products_usecase.dart' as _i31;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i22;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i23;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i24;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i25;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i19;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i34;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i32;
import '../../presentation/screens/home/products/bloc/products_bloc.dart'
    as _i33;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i9;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i28;
import 'register_module.dart' as _i35; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i11.ProductPaginationResponseMapper>(() =>
      _i11.ProductPaginationResponseMapper(
          get<_i10.ProductMiniResponseMapper>()));
  await gh.lazySingletonAsync<_i12.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i13.SubcategoryResponseMapper>(
      () => _i13.SubcategoryResponseMapper());
  gh.lazySingleton<_i14.TagResponseMapper>(() => _i14.TagResponseMapper());
  gh.lazySingleton<_i15.GroupResponseMapper>(
      () => _i15.GroupResponseMapper(get<_i13.SubcategoryResponseMapper>()));
  gh.lazySingleton<_i16.Preferences>(
      () => _i16.Preferences(get<_i12.SharedPreferences>()));
  gh.lazySingleton<_i17.PreferencesRepository>(() =>
      _i18.PreferencesRepositoryImpl(
          get<_i7.ErrorMapper>(), get<_i16.Preferences>()));
  gh.lazySingleton<_i19.SetPreferenceUseCase>(
      () => _i19.SetPreferenceUseCase(get<_i17.PreferencesRepository>()));
  gh.lazySingleton<_i20.AuthInterceptor>(
      () => _i20.AuthInterceptor(get<_i16.Preferences>()));
  gh.lazySingleton<_i21.CategoryResponseMapper>(
      () => _i21.CategoryResponseMapper(get<_i15.GroupResponseMapper>()));
  gh.lazySingleton<_i22.GetBoolPreferenceUseCase>(
      () => _i22.GetBoolPreferenceUseCase(get<_i17.PreferencesRepository>()));
  gh.lazySingleton<_i23.GetDoublePreferenceUseCase>(
      () => _i23.GetDoublePreferenceUseCase(get<_i17.PreferencesRepository>()));
  gh.lazySingleton<_i24.GetIntPreferenceUseCase>(
      () => _i24.GetIntPreferenceUseCase(get<_i17.PreferencesRepository>()));
  gh.lazySingleton<_i25.GetStringPreferenceUseCase>(
      () => _i25.GetStringPreferenceUseCase(get<_i17.PreferencesRepository>()));
  gh.lazySingleton<_i26.ProductRepository>(() => _i27.ProductRepositoryImpl(
      get<_i8.ExceptionHandler>(),
      get<_i6.CommonNetwork>(),
      get<_i21.CategoryResponseMapper>(),
      get<_i5.BannerResponseMapper>(),
      get<_i14.TagResponseMapper>(),
      get<_i11.ProductPaginationResponseMapper>()));
  gh.factory<_i28.StartBloc>(() => _i28.StartBloc(
      get<_i22.GetBoolPreferenceUseCase>(),
      get<_i25.GetStringPreferenceUseCase>(),
      get<_i19.SetPreferenceUseCase>()));
  gh.lazySingleton<_i29.FetchCategoriesUseCase>(
      () => _i29.FetchCategoriesUseCase(get<_i26.ProductRepository>()));
  gh.lazySingleton<_i30.FetchHomeUseCase>(
      () => _i30.FetchHomeUseCase(get<_i26.ProductRepository>()));
  gh.lazySingleton<_i31.FetchProductsUseCase>(
      () => _i31.FetchProductsUseCase(get<_i26.ProductRepository>()));
  gh.factory<_i32.HomeBloc>(() => _i32.HomeBloc(get<_i30.FetchHomeUseCase>()));
  gh.factory<_i33.ProductsBloc>(
      () => _i33.ProductsBloc(get<_i31.FetchProductsUseCase>()));
  gh.factory<_i34.CategoryBloc>(
      () => _i34.CategoryBloc(get<_i29.FetchCategoriesUseCase>()));
  return get;
}

class _$RegisterModule extends _i35.RegisterModule {}
