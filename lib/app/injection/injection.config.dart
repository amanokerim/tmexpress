// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../data/error/error_mapper.dart' as _i7;
import '../../data/error/exception_handler.dart' as _i8;
import '../../data/local/preferences.dart' as _i18;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i24;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i17;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i9;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i11;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i12;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i21;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i14;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i15;
import '../../data/mappers/response_mappers/tag_respose_mapper.dart' as _i16;
import '../../data/network/auth_interceptor.dart' as _i23;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i6;
import '../../data/repositories/preferences_repository_impl.dart' as _i20;
import '../../data/repositories/product_repository_impl.dart' as _i30;
import '../../domain/repositories/preferences_repository.dart' as _i19;
import '../../domain/repositories/product_repository.dart' as _i29;
import '../../domain/usecases/fetch_categories_usecase.dart' as _i32;
import '../../domain/usecases/fetch_home_usecase.dart' as _i33;
import '../../domain/usecases/fetch_product_usecase.dart' as _i34;
import '../../domain/usecases/fetch_products_usecase.dart' as _i35;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i25;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i26;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i27;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i28;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i22;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i38;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i39;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i36;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i10;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i37;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i31;
import 'register_module.dart' as _i40; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.ImageResponseMapper>(() => _i9.ImageResponseMapper());
  gh.factory<_i10.MainBloc>(() => _i10.MainBloc());
  gh.lazySingleton<_i11.ProductMiniResponseMapper>(
      () => _i11.ProductMiniResponseMapper());
  gh.lazySingleton<_i12.ProductPaginationResponseMapper>(() =>
      _i12.ProductPaginationResponseMapper(
          get<_i11.ProductMiniResponseMapper>()));
  await gh.lazySingletonAsync<_i13.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i14.SizeResponseMapper>(() => _i14.SizeResponseMapper());
  gh.lazySingleton<_i15.SubcategoryResponseMapper>(
      () => _i15.SubcategoryResponseMapper());
  gh.lazySingleton<_i16.TagResponseMapper>(() => _i16.TagResponseMapper());
  gh.lazySingleton<_i17.GroupResponseMapper>(
      () => _i17.GroupResponseMapper(get<_i15.SubcategoryResponseMapper>()));
  gh.lazySingleton<_i18.Preferences>(
      () => _i18.Preferences(get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i19.PreferencesRepository>(() =>
      _i20.PreferencesRepositoryImpl(
          get<_i7.ErrorMapper>(), get<_i18.Preferences>()));
  gh.lazySingleton<_i21.ProductResponseMapper>(() => _i21.ProductResponseMapper(
      get<_i9.ImageResponseMapper>(), get<_i14.SizeResponseMapper>()));
  gh.lazySingleton<_i22.SetPreferenceUseCase>(
      () => _i22.SetPreferenceUseCase(get<_i19.PreferencesRepository>()));
  gh.lazySingleton<_i23.AuthInterceptor>(
      () => _i23.AuthInterceptor(get<_i18.Preferences>()));
  gh.lazySingleton<_i24.CategoryResponseMapper>(
      () => _i24.CategoryResponseMapper(get<_i17.GroupResponseMapper>()));
  gh.lazySingleton<_i25.GetBoolPreferenceUseCase>(
      () => _i25.GetBoolPreferenceUseCase(get<_i19.PreferencesRepository>()));
  gh.lazySingleton<_i26.GetDoublePreferenceUseCase>(
      () => _i26.GetDoublePreferenceUseCase(get<_i19.PreferencesRepository>()));
  gh.lazySingleton<_i27.GetIntPreferenceUseCase>(
      () => _i27.GetIntPreferenceUseCase(get<_i19.PreferencesRepository>()));
  gh.lazySingleton<_i28.GetStringPreferenceUseCase>(
      () => _i28.GetStringPreferenceUseCase(get<_i19.PreferencesRepository>()));
  gh.lazySingleton<_i29.ProductRepository>(() => _i30.ProductRepositoryImpl(
      get<_i8.ExceptionHandler>(),
      get<_i6.CommonNetwork>(),
      get<_i24.CategoryResponseMapper>(),
      get<_i5.BannerResponseMapper>(),
      get<_i16.TagResponseMapper>(),
      get<_i12.ProductPaginationResponseMapper>(),
      get<_i21.ProductResponseMapper>()));
  gh.factory<_i31.StartBloc>(() => _i31.StartBloc(
      get<_i25.GetBoolPreferenceUseCase>(),
      get<_i28.GetStringPreferenceUseCase>(),
      get<_i22.SetPreferenceUseCase>()));
  gh.lazySingleton<_i32.FetchCategoriesUseCase>(
      () => _i32.FetchCategoriesUseCase(get<_i29.ProductRepository>()));
  gh.lazySingleton<_i33.FetchHomeUseCase>(
      () => _i33.FetchHomeUseCase(get<_i29.ProductRepository>()));
  gh.lazySingleton<_i34.FetchProductUseCase>(
      () => _i34.FetchProductUseCase(get<_i29.ProductRepository>()));
  gh.lazySingleton<_i35.FetchProductsUseCase>(
      () => _i35.FetchProductsUseCase(get<_i29.ProductRepository>()));
  gh.factory<_i36.HomeBloc>(() => _i36.HomeBloc(get<_i33.FetchHomeUseCase>()));
  gh.factory<_i37.ProductsBloc>(
      () => _i37.ProductsBloc(get<_i35.FetchProductsUseCase>()));
  gh.factory<_i38.CategoryBloc>(
      () => _i38.CategoryBloc(get<_i32.FetchCategoriesUseCase>()));
  gh.factory<_i39.DetailBloc>(
      () => _i39.DetailBloc(get<_i34.FetchProductUseCase>()));
  return get;
}

class _$RegisterModule extends _i40.RegisterModule {}
