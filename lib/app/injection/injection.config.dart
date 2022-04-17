// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../../data/error/error_mapper.dart' as _i9;
import '../../data/error/exception_handler.dart' as _i10;
import '../../data/local/preferences.dart' as _i27;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i36;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i24;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i14;
import '../../data/mappers/response_mappers/placed_order_item_response_mapper.dart'
    as _i25;
import '../../data/mappers/response_mappers/placed_order_response_mapper.dart'
    as _i26;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i16;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i17;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i30;
import '../../data/mappers/response_mappers/profile_response_mapper.dart'
    as _i18;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i20;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i21;
import '../../data/mappers/response_mappers/tag_response_mapper.dart' as _i22;
import '../../data/mappers/response_mappers/token_response_mapper.dart' as _i23;
import '../../data/network/auth_interceptor.dart' as _i34;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i8;
import '../../data/repositories/fcm_repository_impl.dart' as _i12;
import '../../data/repositories/order_respository_impl.dart' as _i44;
import '../../data/repositories/preferences_repository_impl.dart' as _i29;
import '../../data/repositories/product_repository_impl.dart' as _i46;
import '../../data/repositories/profile_repository_impl.dart' as _i32;
import '../../domain/repositories/fcm_repository.dart' as _i11;
import '../../domain/repositories/order_repository.dart' as _i43;
import '../../domain/repositories/preferences_repository.dart' as _i28;
import '../../domain/repositories/product_repository.dart' as _i45;
import '../../domain/repositories/profile_repository.dart' as _i31;
import '../../domain/usecases/get_fcm_stream_usecase.dart' as _i13;
import '../../domain/usecases/order/create_order_usecase.dart' as _i52;
import '../../domain/usecases/order/fetch_orders_usecase.dart' as _i58;
import '../../domain/usecases/order/get_placed_order.dart' as _i63;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i39;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i40;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i41;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i42;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i33;
import '../../domain/usecases/products/fetch_categories_usecase.dart' as _i54;
import '../../domain/usecases/products/fetch_favorite_products_usecase.dart'
    as _i55;
import '../../domain/usecases/products/fetch_home_usecase.dart' as _i56;
import '../../domain/usecases/products/fetch_hot_products.dart' as _i57;
import '../../domain/usecases/products/fetch_product_usecase.dart' as _i59;
import '../../domain/usecases/products/fetch_products_usecase.dart' as _i60;
import '../../domain/usecases/products/fetch_subcategory_sizes.dart' as _i61;
import '../../domain/usecases/products/like_product_usecase.dart' as _i66;
import '../../domain/usecases/products/search_product_usecase.dart' as _i48;
import '../../domain/usecases/products/share_product_usecase.dart' as _i49;
import '../../domain/usecases/profile/auth_usecase.dart' as _i35;
import '../../domain/usecases/profile/edit_profile_usecase.dart' as _i37;
import '../../domain/usecases/profile/fetch_profile_usecase.dart' as _i38;
import '../../presentation/screens/auth/bloc/auth_bloc.dart' as _i51;
import '../../presentation/screens/cart/bloc/cart_bloc.dart' as _i71;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i72;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i73;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i64;
import '../../presentation/screens/home/search/bloc/search_bloc.dart' as _i70;
import '../../presentation/screens/hot/bloc/hot_bloc.dart' as _i65;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i15;
import '../../presentation/screens/products/bloc/filter/filter_bloc.dart'
    as _i62;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i69;
import '../../presentation/screens/profile/bloc/profile_bloc.dart' as _i47;
import '../../presentation/screens/profile/edit_profile/bloc/edit_profile_bloc.dart'
    as _i53;
import '../../presentation/screens/profile/placed_order/bloc/placed_order_bloc.dart'
    as _i67;
import '../../presentation/screens/profile/placed_orders/bloc/placed_orders_bloc.dart'
    as _i68;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i50;
import 'register_module.dart' as _i74; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Alice>(() => registerModule.alice);
  gh.lazySingleton<_i4.AuthNetwork>(() => registerModule.authNetwork);
  gh.lazySingleton<_i5.BannerResponseMapper>(() => _i5.BannerResponseMapper());
  gh.lazySingleton<_i6.Box<Map<dynamic, dynamic>>>(
      () => registerModule.favoritesBox);
  gh.lazySingleton<_i7.CacheOptions>(() => registerModule.cacheOption);
  gh.lazySingleton<_i8.CommonNetwork>(() => registerModule.commonNetwork);
  gh.lazySingleton<_i9.ErrorMapper>(() => _i9.ErrorMapper());
  gh.lazySingleton<_i10.ExceptionHandler>(
      () => _i10.ExceptionHandler(get<_i9.ErrorMapper>()));
  gh.lazySingleton<_i11.FCMRepository>(
      () => _i12.FCMRepositoryImpl(get<_i10.ExceptionHandler>()));
  gh.lazySingleton<_i13.GetFCMStreamUseCase>(
      () => _i13.GetFCMStreamUseCase(get<_i11.FCMRepository>()));
  gh.lazySingleton<_i14.ImageResponseMapper>(() => _i14.ImageResponseMapper());
  gh.factory<_i15.MainBloc>(() => _i15.MainBloc());
  gh.lazySingleton<_i16.ProductMiniResponseMapper>(
      () => _i16.ProductMiniResponseMapper());
  gh.lazySingleton<_i17.ProductPaginationResponseMapper>(() =>
      _i17.ProductPaginationResponseMapper(
          get<_i16.ProductMiniResponseMapper>()));
  gh.lazySingleton<_i18.ProfileResponseMapper>(
      () => _i18.ProfileResponseMapper());
  await gh.lazySingletonAsync<_i19.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i20.SizeResponseMapper>(() => _i20.SizeResponseMapper());
  gh.lazySingleton<_i21.SubcategoryResponseMapper>(
      () => _i21.SubcategoryResponseMapper());
  gh.lazySingleton<_i22.TagResponseMapper>(
      () => _i22.TagResponseMapper(get<_i16.ProductMiniResponseMapper>()));
  gh.lazySingleton<_i23.TokenResponseMapper>(() => _i23.TokenResponseMapper());
  gh.lazySingleton<_i24.GroupResponseMapper>(
      () => _i24.GroupResponseMapper(get<_i21.SubcategoryResponseMapper>()));
  gh.lazySingleton<_i25.PlacedOrderItemResponseMapper>(() =>
      _i25.PlacedOrderItemResponseMapper(get<_i16.ProductMiniResponseMapper>(),
          get<_i20.SizeResponseMapper>(), get<_i14.ImageResponseMapper>()));
  gh.lazySingleton<_i26.PlacedOrderResponseMapper>(() =>
      _i26.PlacedOrderResponseMapper(
          get<_i25.PlacedOrderItemResponseMapper>()));
  gh.lazySingleton<_i27.Preferences>(
      () => _i27.Preferences(get<_i19.SharedPreferences>()));
  gh.lazySingleton<_i28.PreferencesRepository>(() =>
      _i29.PreferencesRepositoryImpl(
          get<_i10.ExceptionHandler>(), get<_i27.Preferences>()));
  gh.lazySingleton<_i30.ProductResponseMapper>(() => _i30.ProductResponseMapper(
      get<_i14.ImageResponseMapper>(), get<_i20.SizeResponseMapper>()));
  gh.lazySingleton<_i31.ProfileRepository>(() => _i32.ProfileRepositoryImpl(
      get<_i10.ExceptionHandler>(),
      get<_i8.CommonNetwork>(),
      get<_i27.Preferences>(),
      get<_i23.TokenResponseMapper>(),
      get<_i4.AuthNetwork>(),
      get<_i18.ProfileResponseMapper>()));
  gh.lazySingleton<_i33.SetPreferenceUseCase>(
      () => _i33.SetPreferenceUseCase(get<_i28.PreferencesRepository>()));
  gh.lazySingleton<_i34.AuthInterceptor>(
      () => _i34.AuthInterceptor(get<_i27.Preferences>()));
  gh.lazySingleton<_i35.AuthUseCase>(
      () => _i35.AuthUseCase(get<_i31.ProfileRepository>()));
  gh.lazySingleton<_i36.CategoryResponseMapper>(
      () => _i36.CategoryResponseMapper(get<_i24.GroupResponseMapper>()));
  gh.lazySingleton<_i37.EditProfileUseCase>(
      () => _i37.EditProfileUseCase(get<_i31.ProfileRepository>()));
  gh.lazySingleton<_i38.FetchProfileUseCase>(
      () => _i38.FetchProfileUseCase(get<_i31.ProfileRepository>()));
  gh.lazySingleton<_i39.GetBoolPreferenceUseCase>(
      () => _i39.GetBoolPreferenceUseCase(get<_i28.PreferencesRepository>()));
  gh.lazySingleton<_i40.GetDoublePreferenceUseCase>(
      () => _i40.GetDoublePreferenceUseCase(get<_i28.PreferencesRepository>()));
  gh.lazySingleton<_i41.GetIntPreferenceUseCase>(
      () => _i41.GetIntPreferenceUseCase(get<_i28.PreferencesRepository>()));
  gh.lazySingleton<_i42.GetStringPreferenceUseCase>(
      () => _i42.GetStringPreferenceUseCase(get<_i28.PreferencesRepository>()));
  gh.lazySingleton<_i43.OrderRepository>(() => _i44.OrderRepositoryImpl(
      get<_i10.ExceptionHandler>(),
      get<_i4.AuthNetwork>(),
      get<_i26.PlacedOrderResponseMapper>()));
  gh.lazySingleton<_i45.ProductRepository>(() => _i46.ProductRepositoryImpl(
      get<_i10.ExceptionHandler>(),
      get<_i8.CommonNetwork>(),
      get<_i4.AuthNetwork>(),
      get<_i36.CategoryResponseMapper>(),
      get<_i5.BannerResponseMapper>(),
      get<_i22.TagResponseMapper>(),
      get<_i17.ProductPaginationResponseMapper>(),
      get<_i30.ProductResponseMapper>(),
      get<_i20.SizeResponseMapper>(),
      get<_i6.Box<Map<dynamic, dynamic>>>()));
  gh.factory<_i47.ProfileBloc>(() => _i47.ProfileBloc(
      get<_i42.GetStringPreferenceUseCase>(),
      get<_i38.FetchProfileUseCase>(),
      get<_i33.SetPreferenceUseCase>()));
  gh.lazySingleton<_i48.SearchProductsUseCase>(
      () => _i48.SearchProductsUseCase(get<_i45.ProductRepository>()));
  gh.lazySingleton<_i49.ShareProductUseCase>(
      () => _i49.ShareProductUseCase(get<_i45.ProductRepository>()));
  gh.factory<_i50.StartBloc>(() => _i50.StartBloc(
      get<_i39.GetBoolPreferenceUseCase>(),
      get<_i42.GetStringPreferenceUseCase>(),
      get<_i33.SetPreferenceUseCase>(),
      get<_i13.GetFCMStreamUseCase>()));
  gh.factory<_i51.AuthBloc>(() => _i51.AuthBloc(get<_i35.AuthUseCase>()));
  gh.lazySingleton<_i52.CreateOrderUseCase>(
      () => _i52.CreateOrderUseCase(get<_i43.OrderRepository>()));
  gh.factory<_i53.EditProfileBloc>(
      () => _i53.EditProfileBloc(get<_i37.EditProfileUseCase>()));
  gh.lazySingleton<_i54.FetchCategoriesUseCase>(
      () => _i54.FetchCategoriesUseCase(get<_i45.ProductRepository>()));
  gh.lazySingleton<_i55.FetchFavoriteProductsUseCase>(
      () => _i55.FetchFavoriteProductsUseCase(get<_i45.ProductRepository>()));
  gh.lazySingleton<_i56.FetchHomeUseCase>(
      () => _i56.FetchHomeUseCase(get<_i45.ProductRepository>()));
  gh.lazySingleton<_i57.FetchHotProducts>(
      () => _i57.FetchHotProducts(get<_i45.ProductRepository>()));
  gh.lazySingleton<_i58.FetchPlacedOrdersUseCase>(
      () => _i58.FetchPlacedOrdersUseCase(get<_i43.OrderRepository>()));
  gh.lazySingleton<_i59.FetchProductUseCase>(
      () => _i59.FetchProductUseCase(get<_i45.ProductRepository>()));
  gh.lazySingleton<_i60.FetchProductsUseCase>(
      () => _i60.FetchProductsUseCase(get<_i45.ProductRepository>()));
  gh.lazySingleton<_i61.FetchSubcategorySizesUseCase>(
      () => _i61.FetchSubcategorySizesUseCase(get<_i45.ProductRepository>()));
  gh.factory<_i62.FilterBloc>(
      () => _i62.FilterBloc(get<_i61.FetchSubcategorySizesUseCase>()));
  gh.lazySingleton<_i63.GetPlacedOrderUseCase>(
      () => _i63.GetPlacedOrderUseCase(get<_i43.OrderRepository>()));
  gh.factory<_i64.HomeBloc>(() => _i64.HomeBloc(get<_i56.FetchHomeUseCase>()));
  gh.factory<_i65.HotBloc>(() => _i65.HotBloc(get<_i57.FetchHotProducts>()));
  gh.lazySingleton<_i66.LikeProductUseCase>(
      () => _i66.LikeProductUseCase(get<_i45.ProductRepository>()));
  gh.factory<_i67.PlacedOrderBloc>(
      () => _i67.PlacedOrderBloc(get<_i63.GetPlacedOrderUseCase>()));
  gh.factory<_i68.PlacedOrdersBloc>(
      () => _i68.PlacedOrdersBloc(get<_i58.FetchPlacedOrdersUseCase>()));
  gh.factory<_i69.ProductsBloc>(
      () => _i69.ProductsBloc(get<_i60.FetchProductsUseCase>()));
  gh.factory<_i70.SearchBloc>(
      () => _i70.SearchBloc(get<_i48.SearchProductsUseCase>()));
  gh.factory<_i71.CartBloc>(
      () => _i71.CartBloc(get<_i52.CreateOrderUseCase>()));
  gh.factory<_i72.CategoryBloc>(
      () => _i72.CategoryBloc(get<_i54.FetchCategoriesUseCase>()));
  gh.factory<_i73.DetailBloc>(() => _i73.DetailBloc(
      get<_i59.FetchProductUseCase>(),
      get<_i66.LikeProductUseCase>(),
      get<_i49.ShareProductUseCase>(),
      get<_i47.ProfileBloc>()));
  return get;
}

class _$RegisterModule extends _i74.RegisterModule {}
