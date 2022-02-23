// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../../data/error/error_mapper.dart' as _i7;
import '../../data/error/exception_handler.dart' as _i8;
import '../../data/local/preferences.dart' as _i23;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i33;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i22;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i9;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i13;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i14;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i26;
import '../../data/mappers/response_mappers/profile_response_mapper.dart'
    as _i15;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i17;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i18;
import '../../data/mappers/response_mappers/tag_response_mapper.dart' as _i19;
import '../../data/mappers/response_mappers/token_response_mapper.dart' as _i20;
import '../../data/network/auth_interceptor.dart' as _i30;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i6;
import '../../data/repositories/order_respository_impl.dart' as _i12;
import '../../data/repositories/preferences_repository_impl.dart' as _i25;
import '../../data/repositories/product_repository_impl.dart' as _i40;
import '../../data/repositories/profile_repository_impl.dart' as _i28;
import '../../domain/repositories/order_repository.dart' as _i11;
import '../../domain/repositories/preferences_repository.dart' as _i24;
import '../../domain/repositories/product_repository.dart' as _i39;
import '../../domain/repositories/profile_repository.dart' as _i27;
import '../../domain/usecases/order/create_order_usecase.dart' as _i21;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i35;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i36;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i37;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i38;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i29;
import '../../domain/usecases/products/fetch_categories_usecase.dart' as _i45;
import '../../domain/usecases/products/fetch_home_usecase.dart' as _i46;
import '../../domain/usecases/products/fetch_hot_products.dart' as _i47;
import '../../domain/usecases/products/fetch_product_usecase.dart' as _i48;
import '../../domain/usecases/products/fetch_products_usecase.dart' as _i49;
import '../../domain/usecases/products/fetch_subcategory_sizes.dart' as _i50;
import '../../domain/usecases/products/like_product_usecase.dart' as _i54;
import '../../domain/usecases/products/share_product_usecase.dart' as _i42;
import '../../domain/usecases/profile/auth_usecase.dart' as _i31;
import '../../domain/usecases/profile/fetch_profile_usecase.dart' as _i34;
import '../../presentation/screens/auth/bloc/auth_bloc.dart' as _i44;
import '../../presentation/screens/cart/bloc/cart_bloc.dart' as _i32;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i56;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i57;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i52;
import '../../presentation/screens/hot/bloc/hot_bloc.dart' as _i53;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i10;
import '../../presentation/screens/products/bloc/filter/filter_bloc.dart'
    as _i51;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i55;
import '../../presentation/screens/profile/bloc/profile_bloc.dart' as _i41;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i43;
import 'register_module.dart' as _i58; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i11.OrderRepository>(() => _i12.OrderRepositoryImpl(
      get<_i8.ExceptionHandler>(), get<_i4.AuthNetwork>()));
  gh.lazySingleton<_i13.ProductMiniResponseMapper>(
      () => _i13.ProductMiniResponseMapper());
  gh.lazySingleton<_i14.ProductPaginationResponseMapper>(() =>
      _i14.ProductPaginationResponseMapper(
          get<_i13.ProductMiniResponseMapper>()));
  gh.lazySingleton<_i15.ProfileResponseMapper>(
      () => _i15.ProfileResponseMapper());
  await gh.lazySingletonAsync<_i16.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i17.SizeResponseMapper>(() => _i17.SizeResponseMapper());
  gh.lazySingleton<_i18.SubcategoryResponseMapper>(
      () => _i18.SubcategoryResponseMapper());
  gh.lazySingleton<_i19.TagResponseMapper>(
      () => _i19.TagResponseMapper(get<_i13.ProductMiniResponseMapper>()));
  gh.lazySingleton<_i20.TokenResponseMapper>(() => _i20.TokenResponseMapper());
  gh.lazySingleton<_i21.CreateOrderUseCase>(
      () => _i21.CreateOrderUseCase(get<_i11.OrderRepository>()));
  gh.lazySingleton<_i22.GroupResponseMapper>(
      () => _i22.GroupResponseMapper(get<_i18.SubcategoryResponseMapper>()));
  gh.lazySingleton<_i23.Preferences>(
      () => _i23.Preferences(get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i24.PreferencesRepository>(() =>
      _i25.PreferencesRepositoryImpl(
          get<_i7.ErrorMapper>(), get<_i23.Preferences>()));
  gh.lazySingleton<_i26.ProductResponseMapper>(() => _i26.ProductResponseMapper(
      get<_i9.ImageResponseMapper>(), get<_i17.SizeResponseMapper>()));
  gh.lazySingleton<_i27.ProfileRepository>(() => _i28.ProfileRepositoryImpl(
      get<_i8.ExceptionHandler>(),
      get<_i6.CommonNetwork>(),
      get<_i23.Preferences>(),
      get<_i20.TokenResponseMapper>(),
      get<_i4.AuthNetwork>(),
      get<_i15.ProfileResponseMapper>()));
  gh.lazySingleton<_i29.SetPreferenceUseCase>(
      () => _i29.SetPreferenceUseCase(get<_i24.PreferencesRepository>()));
  gh.lazySingleton<_i30.AuthInterceptor>(
      () => _i30.AuthInterceptor(get<_i23.Preferences>()));
  gh.lazySingleton<_i31.AuthUseCase>(
      () => _i31.AuthUseCase(get<_i27.ProfileRepository>()));
  gh.factory<_i32.CartBloc>(
      () => _i32.CartBloc(get<_i21.CreateOrderUseCase>()));
  gh.lazySingleton<_i33.CategoryResponseMapper>(
      () => _i33.CategoryResponseMapper(get<_i22.GroupResponseMapper>()));
  gh.lazySingleton<_i34.FetchProfileUseCase>(
      () => _i34.FetchProfileUseCase(get<_i27.ProfileRepository>()));
  gh.lazySingleton<_i35.GetBoolPreferenceUseCase>(
      () => _i35.GetBoolPreferenceUseCase(get<_i24.PreferencesRepository>()));
  gh.lazySingleton<_i36.GetDoublePreferenceUseCase>(
      () => _i36.GetDoublePreferenceUseCase(get<_i24.PreferencesRepository>()));
  gh.lazySingleton<_i37.GetIntPreferenceUseCase>(
      () => _i37.GetIntPreferenceUseCase(get<_i24.PreferencesRepository>()));
  gh.lazySingleton<_i38.GetStringPreferenceUseCase>(
      () => _i38.GetStringPreferenceUseCase(get<_i24.PreferencesRepository>()));
  gh.lazySingleton<_i39.ProductRepository>(() => _i40.ProductRepositoryImpl(
      get<_i8.ExceptionHandler>(),
      get<_i6.CommonNetwork>(),
      get<_i4.AuthNetwork>(),
      get<_i33.CategoryResponseMapper>(),
      get<_i5.BannerResponseMapper>(),
      get<_i19.TagResponseMapper>(),
      get<_i14.ProductPaginationResponseMapper>(),
      get<_i26.ProductResponseMapper>(),
      get<_i17.SizeResponseMapper>()));
  gh.factory<_i41.ProfileBloc>(() => _i41.ProfileBloc(
      get<_i38.GetStringPreferenceUseCase>(), get<_i34.FetchProfileUseCase>()));
  gh.lazySingleton<_i42.ShareProductUseCase>(
      () => _i42.ShareProductUseCase(get<_i39.ProductRepository>()));
  gh.factory<_i43.StartBloc>(() => _i43.StartBloc(
      get<_i35.GetBoolPreferenceUseCase>(),
      get<_i38.GetStringPreferenceUseCase>(),
      get<_i29.SetPreferenceUseCase>()));
  gh.factory<_i44.AuthBloc>(() => _i44.AuthBloc(get<_i31.AuthUseCase>()));
  gh.lazySingleton<_i45.FetchCategoriesUseCase>(
      () => _i45.FetchCategoriesUseCase(get<_i39.ProductRepository>()));
  gh.lazySingleton<_i46.FetchHomeUseCase>(
      () => _i46.FetchHomeUseCase(get<_i39.ProductRepository>()));
  gh.lazySingleton<_i47.FetchHotProducts>(
      () => _i47.FetchHotProducts(get<_i39.ProductRepository>()));
  gh.lazySingleton<_i48.FetchProductUseCase>(
      () => _i48.FetchProductUseCase(get<_i39.ProductRepository>()));
  gh.lazySingleton<_i49.FetchProductsUseCase>(
      () => _i49.FetchProductsUseCase(get<_i39.ProductRepository>()));
  gh.lazySingleton<_i50.FetchSubcategorySizesUseCase>(
      () => _i50.FetchSubcategorySizesUseCase(get<_i39.ProductRepository>()));
  gh.factory<_i51.FilterBloc>(
      () => _i51.FilterBloc(get<_i50.FetchSubcategorySizesUseCase>()));
  gh.factory<_i52.HomeBloc>(() => _i52.HomeBloc(get<_i46.FetchHomeUseCase>()));
  gh.factory<_i53.HotBloc>(() => _i53.HotBloc(get<_i47.FetchHotProducts>()));
  gh.lazySingleton<_i54.LikeProductUseCase>(
      () => _i54.LikeProductUseCase(get<_i39.ProductRepository>()));
  gh.factory<_i55.ProductsBloc>(
      () => _i55.ProductsBloc(get<_i49.FetchProductsUseCase>()));
  gh.factory<_i56.CategoryBloc>(
      () => _i56.CategoryBloc(get<_i45.FetchCategoriesUseCase>()));
  gh.factory<_i57.DetailBloc>(() => _i57.DetailBloc(
      get<_i48.FetchProductUseCase>(),
      get<_i54.LikeProductUseCase>(),
      get<_i42.ShareProductUseCase>()));
  return get;
}

class _$RegisterModule extends _i58.RegisterModule {}
