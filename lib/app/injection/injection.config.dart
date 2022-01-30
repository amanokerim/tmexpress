// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../../data/error/error_mapper.dart' as _i9;
import '../../data/error/exception_handler.dart' as _i10;
import '../../data/local/preferences.dart' as _i20;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i6;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i26;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i19;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i11;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i13;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i14;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i23;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i16;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i17;
import '../../data/mappers/response_mappers/tag_respose_mapper.dart' as _i18;
import '../../data/network/auth_interceptor.dart' as _i25;
import '../../data/network/auth_network.dart' as _i5;
import '../../data/network/common_network.dart' as _i8;
import '../../data/repositories/preferences_repository_impl.dart' as _i22;
import '../../data/repositories/product_repository_impl.dart' as _i32;
import '../../domain/repositories/preferences_repository.dart' as _i21;
import '../../domain/repositories/product_repository.dart' as _i31;
import '../../domain/usecases/fetch_categories_usecase.dart' as _i34;
import '../../domain/usecases/fetch_home_usecase.dart' as _i35;
import '../../domain/usecases/fetch_product_usecase.dart' as _i36;
import '../../domain/usecases/fetch_products_usecase.dart' as _i37;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i27;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i28;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i29;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i30;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i24;
import '../../presentation/screens/auth/bloc/auth_bloc.dart' as _i4;
import '../../presentation/screens/cart/bloc/cart_bloc.dart' as _i7;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i40;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i41;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i38;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i12;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i39;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i33;
import 'register_module.dart' as _i42; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Alice>(() => registerModule.alice);
  gh.factory<_i4.AuthBloc>(() => _i4.AuthBloc());
  gh.lazySingleton<_i5.AuthNetwork>(() => registerModule.authNetwork);
  gh.lazySingleton<_i6.BannerResponseMapper>(() => _i6.BannerResponseMapper());
  gh.factory<_i7.CartBloc>(() => _i7.CartBloc());
  gh.lazySingleton<_i8.CommonNetwork>(() => registerModule.commonNetwork);
  gh.lazySingleton<_i9.ErrorMapper>(() => _i9.ErrorMapper());
  gh.lazySingleton<_i10.ExceptionHandler>(
      () => _i10.ExceptionHandler(get<_i9.ErrorMapper>()));
  gh.lazySingleton<_i11.ImageResponseMapper>(() => _i11.ImageResponseMapper());
  gh.factory<_i12.MainBloc>(() => _i12.MainBloc());
  gh.lazySingleton<_i13.ProductMiniResponseMapper>(
      () => _i13.ProductMiniResponseMapper());
  gh.lazySingleton<_i14.ProductPaginationResponseMapper>(() =>
      _i14.ProductPaginationResponseMapper(
          get<_i13.ProductMiniResponseMapper>()));
  await gh.lazySingletonAsync<_i15.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i16.SizeResponseMapper>(() => _i16.SizeResponseMapper());
  gh.lazySingleton<_i17.SubcategoryResponseMapper>(
      () => _i17.SubcategoryResponseMapper());
  gh.lazySingleton<_i18.TagResponseMapper>(
      () => _i18.TagResponseMapper(get<_i13.ProductMiniResponseMapper>()));
  gh.lazySingleton<_i19.GroupResponseMapper>(
      () => _i19.GroupResponseMapper(get<_i17.SubcategoryResponseMapper>()));
  gh.lazySingleton<_i20.Preferences>(
      () => _i20.Preferences(get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i21.PreferencesRepository>(() =>
      _i22.PreferencesRepositoryImpl(
          get<_i9.ErrorMapper>(), get<_i20.Preferences>()));
  gh.lazySingleton<_i23.ProductResponseMapper>(() => _i23.ProductResponseMapper(
      get<_i11.ImageResponseMapper>(), get<_i16.SizeResponseMapper>()));
  gh.lazySingleton<_i24.SetPreferenceUseCase>(
      () => _i24.SetPreferenceUseCase(get<_i21.PreferencesRepository>()));
  gh.lazySingleton<_i25.AuthInterceptor>(
      () => _i25.AuthInterceptor(get<_i20.Preferences>()));
  gh.lazySingleton<_i26.CategoryResponseMapper>(
      () => _i26.CategoryResponseMapper(get<_i19.GroupResponseMapper>()));
  gh.lazySingleton<_i27.GetBoolPreferenceUseCase>(
      () => _i27.GetBoolPreferenceUseCase(get<_i21.PreferencesRepository>()));
  gh.lazySingleton<_i28.GetDoublePreferenceUseCase>(
      () => _i28.GetDoublePreferenceUseCase(get<_i21.PreferencesRepository>()));
  gh.lazySingleton<_i29.GetIntPreferenceUseCase>(
      () => _i29.GetIntPreferenceUseCase(get<_i21.PreferencesRepository>()));
  gh.lazySingleton<_i30.GetStringPreferenceUseCase>(
      () => _i30.GetStringPreferenceUseCase(get<_i21.PreferencesRepository>()));
  gh.lazySingleton<_i31.ProductRepository>(() => _i32.ProductRepositoryImpl(
      get<_i10.ExceptionHandler>(),
      get<_i8.CommonNetwork>(),
      get<_i26.CategoryResponseMapper>(),
      get<_i6.BannerResponseMapper>(),
      get<_i18.TagResponseMapper>(),
      get<_i14.ProductPaginationResponseMapper>(),
      get<_i23.ProductResponseMapper>()));
  gh.factory<_i33.StartBloc>(() => _i33.StartBloc(
      get<_i27.GetBoolPreferenceUseCase>(),
      get<_i30.GetStringPreferenceUseCase>(),
      get<_i24.SetPreferenceUseCase>()));
  gh.lazySingleton<_i34.FetchCategoriesUseCase>(
      () => _i34.FetchCategoriesUseCase(get<_i31.ProductRepository>()));
  gh.lazySingleton<_i35.FetchHomeUseCase>(
      () => _i35.FetchHomeUseCase(get<_i31.ProductRepository>()));
  gh.lazySingleton<_i36.FetchProductUseCase>(
      () => _i36.FetchProductUseCase(get<_i31.ProductRepository>()));
  gh.lazySingleton<_i37.FetchProductsUseCase>(
      () => _i37.FetchProductsUseCase(get<_i31.ProductRepository>()));
  gh.factory<_i38.HomeBloc>(() => _i38.HomeBloc(get<_i35.FetchHomeUseCase>()));
  gh.factory<_i39.ProductsBloc>(
      () => _i39.ProductsBloc(get<_i37.FetchProductsUseCase>()));
  gh.factory<_i40.CategoryBloc>(
      () => _i40.CategoryBloc(get<_i34.FetchCategoriesUseCase>()));
  gh.factory<_i41.DetailBloc>(
      () => _i41.DetailBloc(get<_i36.FetchProductUseCase>()));
  return get;
}

class _$RegisterModule extends _i42.RegisterModule {}
