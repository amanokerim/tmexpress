// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../../data/error/error_mapper.dart' as _i8;
import '../../data/error/exception_handler.dart' as _i9;
import '../../data/local/preferences.dart' as _i21;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i30;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i20;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i10;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i12;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i13;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i24;
import '../../data/mappers/response_mappers/profile_response_mapper.dart'
    as _i14;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i16;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i17;
import '../../data/mappers/response_mappers/tag_respose_mapper.dart' as _i18;
import '../../data/mappers/response_mappers/token_response_mapper.dart' as _i19;
import '../../data/network/auth_interceptor.dart' as _i28;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i7;
import '../../data/repositories/preferences_repository_impl.dart' as _i23;
import '../../data/repositories/product_repository_impl.dart' as _i37;
import '../../data/repositories/profile_repository_impl.dart' as _i26;
import '../../domain/repositories/preferences_repository.dart' as _i22;
import '../../domain/repositories/product_repository.dart' as _i36;
import '../../domain/repositories/profile_repository.dart' as _i25;
import '../../domain/usecases/fetch_categories_usecase.dart' as _i41;
import '../../domain/usecases/fetch_home_usecase.dart' as _i42;
import '../../domain/usecases/fetch_product_usecase.dart' as _i43;
import '../../domain/usecases/fetch_products_usecase.dart' as _i44;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i32;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i33;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i34;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i35;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i27;
import '../../domain/usecases/profile/auth_usecase.dart' as _i29;
import '../../domain/usecases/profile/fetch_profile_usecase.dart' as _i31;
import '../../presentation/screens/auth/bloc/auth_bloc.dart' as _i40;
import '../../presentation/screens/cart/bloc/cart_bloc.dart' as _i6;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i47;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i48;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i45;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i11;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i46;
import '../../presentation/screens/profile/bloc/profile_bloc.dart' as _i38;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i39;
import 'register_module.dart' as _i49; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i14.ProfileResponseMapper>(
      () => _i14.ProfileResponseMapper());
  await gh.lazySingletonAsync<_i15.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i16.SizeResponseMapper>(() => _i16.SizeResponseMapper());
  gh.lazySingleton<_i17.SubcategoryResponseMapper>(
      () => _i17.SubcategoryResponseMapper());
  gh.lazySingleton<_i18.TagResponseMapper>(
      () => _i18.TagResponseMapper(get<_i12.ProductMiniResponseMapper>()));
  gh.lazySingleton<_i19.TokenResponseMapper>(() => _i19.TokenResponseMapper());
  gh.lazySingleton<_i20.GroupResponseMapper>(
      () => _i20.GroupResponseMapper(get<_i17.SubcategoryResponseMapper>()));
  gh.lazySingleton<_i21.Preferences>(
      () => _i21.Preferences(get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i22.PreferencesRepository>(() =>
      _i23.PreferencesRepositoryImpl(
          get<_i8.ErrorMapper>(), get<_i21.Preferences>()));
  gh.lazySingleton<_i24.ProductResponseMapper>(() => _i24.ProductResponseMapper(
      get<_i10.ImageResponseMapper>(), get<_i16.SizeResponseMapper>()));
  gh.lazySingleton<_i25.ProfileRepository>(() => _i26.ProfileRepositoryImpl(
      get<_i9.ExceptionHandler>(),
      get<_i7.CommonNetwork>(),
      get<_i21.Preferences>(),
      get<_i19.TokenResponseMapper>(),
      get<_i4.AuthNetwork>(),
      get<_i14.ProfileResponseMapper>()));
  gh.lazySingleton<_i27.SetPreferenceUseCase>(
      () => _i27.SetPreferenceUseCase(get<_i22.PreferencesRepository>()));
  gh.lazySingleton<_i28.AuthInterceptor>(
      () => _i28.AuthInterceptor(get<_i21.Preferences>()));
  gh.lazySingleton<_i29.AuthUseCase>(
      () => _i29.AuthUseCase(get<_i25.ProfileRepository>()));
  gh.lazySingleton<_i30.CategoryResponseMapper>(
      () => _i30.CategoryResponseMapper(get<_i20.GroupResponseMapper>()));
  gh.lazySingleton<_i31.FetchProfileUseCase>(
      () => _i31.FetchProfileUseCase(get<_i25.ProfileRepository>()));
  gh.lazySingleton<_i32.GetBoolPreferenceUseCase>(
      () => _i32.GetBoolPreferenceUseCase(get<_i22.PreferencesRepository>()));
  gh.lazySingleton<_i33.GetDoublePreferenceUseCase>(
      () => _i33.GetDoublePreferenceUseCase(get<_i22.PreferencesRepository>()));
  gh.lazySingleton<_i34.GetIntPreferenceUseCase>(
      () => _i34.GetIntPreferenceUseCase(get<_i22.PreferencesRepository>()));
  gh.lazySingleton<_i35.GetStringPreferenceUseCase>(
      () => _i35.GetStringPreferenceUseCase(get<_i22.PreferencesRepository>()));
  gh.lazySingleton<_i36.ProductRepository>(() => _i37.ProductRepositoryImpl(
      get<_i9.ExceptionHandler>(),
      get<_i7.CommonNetwork>(),
      get<_i30.CategoryResponseMapper>(),
      get<_i5.BannerResponseMapper>(),
      get<_i18.TagResponseMapper>(),
      get<_i13.ProductPaginationResponseMapper>(),
      get<_i24.ProductResponseMapper>()));
  gh.factory<_i38.ProfileBloc>(() => _i38.ProfileBloc(
      get<_i35.GetStringPreferenceUseCase>(), get<_i31.FetchProfileUseCase>()));
  gh.factory<_i39.StartBloc>(() => _i39.StartBloc(
      get<_i32.GetBoolPreferenceUseCase>(),
      get<_i35.GetStringPreferenceUseCase>(),
      get<_i27.SetPreferenceUseCase>()));
  gh.factory<_i40.AuthBloc>(() => _i40.AuthBloc(get<_i29.AuthUseCase>()));
  gh.lazySingleton<_i41.FetchCategoriesUseCase>(
      () => _i41.FetchCategoriesUseCase(get<_i36.ProductRepository>()));
  gh.lazySingleton<_i42.FetchHomeUseCase>(
      () => _i42.FetchHomeUseCase(get<_i36.ProductRepository>()));
  gh.lazySingleton<_i43.FetchProductUseCase>(
      () => _i43.FetchProductUseCase(get<_i36.ProductRepository>()));
  gh.lazySingleton<_i44.FetchProductsUseCase>(
      () => _i44.FetchProductsUseCase(get<_i36.ProductRepository>()));
  gh.factory<_i45.HomeBloc>(() => _i45.HomeBloc(get<_i42.FetchHomeUseCase>()));
  gh.factory<_i46.ProductsBloc>(
      () => _i46.ProductsBloc(get<_i44.FetchProductsUseCase>()));
  gh.factory<_i47.CategoryBloc>(
      () => _i47.CategoryBloc(get<_i41.FetchCategoriesUseCase>()));
  gh.factory<_i48.DetailBloc>(
      () => _i48.DetailBloc(get<_i43.FetchProductUseCase>()));
  return get;
}

class _$RegisterModule extends _i49.RegisterModule {}
