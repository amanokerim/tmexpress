// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../../data/error/error_mapper.dart' as _i8;
import '../../data/error/exception_handler.dart' as _i9;
import '../../data/local/preferences.dart' as _i19;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i25;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i18;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i10;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i12;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i13;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i22;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i15;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i16;
import '../../data/mappers/response_mappers/tag_respose_mapper.dart' as _i17;
import '../../data/network/auth_interceptor.dart' as _i24;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i7;
import '../../data/repositories/preferences_repository_impl.dart' as _i21;
import '../../data/repositories/product_repository_impl.dart' as _i31;
import '../../domain/repositories/preferences_repository.dart' as _i20;
import '../../domain/repositories/product_repository.dart' as _i30;
import '../../domain/usecases/fetch_categories_usecase.dart' as _i33;
import '../../domain/usecases/fetch_home_usecase.dart' as _i34;
import '../../domain/usecases/fetch_product_usecase.dart' as _i35;
import '../../domain/usecases/fetch_products_usecase.dart' as _i36;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i26;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i27;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i28;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i29;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i23;
import '../../presentation/screens/cart/bloc/cart_bloc.dart' as _i6;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i39;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i40;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i37;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i11;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i38;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i32;
import 'register_module.dart' as _i41; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Alice>(() => registerModule.alice);
  gh.lazySingleton<_i4.AuthNetwork>(() => registerModule.authNetwork);
  gh.lazySingleton<_i5.BannerResponseMapper>(() => _i5.BannerResponseMapper());
  gh.factory<_i6.CartBloc>(() => _i6.CartBloc());
  gh.lazySingleton<_i7.CommonNetwork>(() => registerModule.commonNetwork);
  gh.lazySingleton<_i8.ErrorMapper>(() => _i8.ErrorMapper());
  gh.lazySingleton<_i9.ExceptionHandler>(
      () => _i9.ExceptionHandler(get<_i8.ErrorMapper>()));
  gh.lazySingleton<_i10.ImageResponseMapper>(() => _i10.ImageResponseMapper());
  gh.factory<_i11.MainBloc>(() => _i11.MainBloc());
  gh.lazySingleton<_i12.ProductMiniResponseMapper>(
      () => _i12.ProductMiniResponseMapper());
  gh.lazySingleton<_i13.ProductPaginationResponseMapper>(() =>
      _i13.ProductPaginationResponseMapper(
          get<_i12.ProductMiniResponseMapper>()));
  await gh.lazySingletonAsync<_i14.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i15.SizeResponseMapper>(() => _i15.SizeResponseMapper());
  gh.lazySingleton<_i16.SubcategoryResponseMapper>(
      () => _i16.SubcategoryResponseMapper());
  gh.lazySingleton<_i17.TagResponseMapper>(
      () => _i17.TagResponseMapper(get<_i12.ProductMiniResponseMapper>()));
  gh.lazySingleton<_i18.GroupResponseMapper>(
      () => _i18.GroupResponseMapper(get<_i16.SubcategoryResponseMapper>()));
  gh.lazySingleton<_i19.Preferences>(
      () => _i19.Preferences(get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i20.PreferencesRepository>(() =>
      _i21.PreferencesRepositoryImpl(
          get<_i8.ErrorMapper>(), get<_i19.Preferences>()));
  gh.lazySingleton<_i22.ProductResponseMapper>(() => _i22.ProductResponseMapper(
      get<_i10.ImageResponseMapper>(), get<_i15.SizeResponseMapper>()));
  gh.lazySingleton<_i23.SetPreferenceUseCase>(
      () => _i23.SetPreferenceUseCase(get<_i20.PreferencesRepository>()));
  gh.lazySingleton<_i24.AuthInterceptor>(
      () => _i24.AuthInterceptor(get<_i19.Preferences>()));
  gh.lazySingleton<_i25.CategoryResponseMapper>(
      () => _i25.CategoryResponseMapper(get<_i18.GroupResponseMapper>()));
  gh.lazySingleton<_i26.GetBoolPreferenceUseCase>(
      () => _i26.GetBoolPreferenceUseCase(get<_i20.PreferencesRepository>()));
  gh.lazySingleton<_i27.GetDoublePreferenceUseCase>(
      () => _i27.GetDoublePreferenceUseCase(get<_i20.PreferencesRepository>()));
  gh.lazySingleton<_i28.GetIntPreferenceUseCase>(
      () => _i28.GetIntPreferenceUseCase(get<_i20.PreferencesRepository>()));
  gh.lazySingleton<_i29.GetStringPreferenceUseCase>(
      () => _i29.GetStringPreferenceUseCase(get<_i20.PreferencesRepository>()));
  gh.lazySingleton<_i30.ProductRepository>(() => _i31.ProductRepositoryImpl(
      get<_i9.ExceptionHandler>(),
      get<_i7.CommonNetwork>(),
      get<_i25.CategoryResponseMapper>(),
      get<_i5.BannerResponseMapper>(),
      get<_i17.TagResponseMapper>(),
      get<_i13.ProductPaginationResponseMapper>(),
      get<_i22.ProductResponseMapper>()));
  gh.factory<_i32.StartBloc>(() => _i32.StartBloc(
      get<_i26.GetBoolPreferenceUseCase>(),
      get<_i29.GetStringPreferenceUseCase>(),
      get<_i23.SetPreferenceUseCase>()));
  gh.lazySingleton<_i33.FetchCategoriesUseCase>(
      () => _i33.FetchCategoriesUseCase(get<_i30.ProductRepository>()));
  gh.lazySingleton<_i34.FetchHomeUseCase>(
      () => _i34.FetchHomeUseCase(get<_i30.ProductRepository>()));
  gh.lazySingleton<_i35.FetchProductUseCase>(
      () => _i35.FetchProductUseCase(get<_i30.ProductRepository>()));
  gh.lazySingleton<_i36.FetchProductsUseCase>(
      () => _i36.FetchProductsUseCase(get<_i30.ProductRepository>()));
  gh.factory<_i37.HomeBloc>(() => _i37.HomeBloc(get<_i34.FetchHomeUseCase>()));
  gh.factory<_i38.ProductsBloc>(
      () => _i38.ProductsBloc(get<_i36.FetchProductsUseCase>()));
  gh.factory<_i39.CategoryBloc>(
      () => _i39.CategoryBloc(get<_i33.FetchCategoriesUseCase>()));
  gh.factory<_i40.DetailBloc>(
      () => _i40.DetailBloc(get<_i35.FetchProductUseCase>()));
  return get;
}

class _$RegisterModule extends _i41.RegisterModule {}
