// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i23;

import '../../data/error/error_mapper.dart' as _i9;
import '../../data/error/exception_handler.dart' as _i10;
import '../../data/local/hive_boxes.dart' as _i14;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i41;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i33;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i15;
import '../../data/mappers/response_mappers/placed_order_item_response_mapper.dart'
    as _i34;
import '../../data/mappers/response_mappers/placed_order_response_mapper.dart'
    as _i35;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i19;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i20;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i36;
import '../../data/mappers/response_mappers/profile_response_mapper.dart'
    as _i21;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i24;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i25;
import '../../data/mappers/response_mappers/tag_response_mapper.dart' as _i26;
import '../../data/mappers/response_mappers/token_response_mapper.dart' as _i27;
import '../../data/network/auth_interceptor.dart' as _i28;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i8;
import '../../data/repositories/fcm_repository_impl.dart' as _i12;
import '../../data/repositories/order_respository_impl.dart' as _i45;
import '../../data/repositories/preferences_repository_impl.dart' as _i18;
import '../../data/repositories/product_repository_impl.dart' as _i47;
import '../../data/repositories/profile_repository_impl.dart' as _i38;
import '../../domain/repositories/fcm_repository.dart' as _i11;
import '../../domain/repositories/order_repository.dart' as _i44;
import '../../domain/repositories/preferences_repository.dart' as _i17;
import '../../domain/repositories/product_repository.dart' as _i46;
import '../../domain/repositories/profile_repository.dart' as _i37;
import '../../domain/usecases/get_fcm_stream_usecase.dart' as _i13;
import '../../domain/usecases/order/create_order_usecase.dart' as _i52;
import '../../domain/usecases/order/fetch_orders_usecase.dart' as _i58;
import '../../domain/usecases/order/get_placed_order.dart' as _i63;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i29;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i30;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i31;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i32;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i22;
import '../../domain/usecases/products/fetch_categories_usecase.dart' as _i54;
import '../../domain/usecases/products/fetch_favorite_products_usecase.dart'
    as _i55;
import '../../domain/usecases/products/fetch_home_usecase.dart' as _i56;
import '../../domain/usecases/products/fetch_hot_products.dart' as _i57;
import '../../domain/usecases/products/fetch_product_usecase.dart' as _i59;
import '../../domain/usecases/products/fetch_products_usecase.dart' as _i60;
import '../../domain/usecases/products/fetch_subcategory_sizes.dart' as _i61;
import '../../domain/usecases/products/like_product_usecase.dart' as _i66;
import '../../domain/usecases/products/search_product_usecase.dart' as _i49;
import '../../domain/usecases/products/share_product_usecase.dart' as _i50;
import '../../domain/usecases/profile/auth_usecase.dart' as _i40;
import '../../domain/usecases/profile/edit_profile_usecase.dart' as _i42;
import '../../domain/usecases/profile/fetch_profile_usecase.dart' as _i43;
import '../../presentation/screens/auth/bloc/auth_bloc.dart' as _i51;
import '../../presentation/screens/cart/bloc/cart_bloc.dart' as _i71;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i72;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i73;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i64;
import '../../presentation/screens/home/search/bloc/search_bloc.dart' as _i70;
import '../../presentation/screens/hot/bloc/hot_bloc.dart' as _i65;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i16;
import '../../presentation/screens/products/bloc/filter/filter_bloc.dart'
    as _i62;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i69;
import '../../presentation/screens/profile/bloc/profile_bloc.dart' as _i48;
import '../../presentation/screens/profile/edit_profile/bloc/edit_profile_bloc.dart'
    as _i53;
import '../../presentation/screens/profile/placed_order/bloc/placed_order_bloc.dart'
    as _i67;
import '../../presentation/screens/profile/placed_orders/bloc/placed_orders_bloc.dart'
    as _i68;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i39;
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
  gh.lazySingleton<_i6.Box<dynamic>>(() => registerModule.favoritesBox);
  gh.lazySingleton<_i7.CacheOptions>(() => registerModule.cacheOption);
  gh.lazySingleton<_i8.CommonNetwork>(() => registerModule.commonNetwork);
  gh.lazySingleton<_i9.ErrorMapper>(() => _i9.ErrorMapper());
  gh.lazySingleton<_i10.ExceptionHandler>(
      () => _i10.ExceptionHandler(get<_i9.ErrorMapper>()));
  gh.lazySingleton<_i11.FCMRepository>(() => _i12.FCMRepositoryImpl());
  gh.lazySingleton<_i13.GetFCMStreamUseCase>(
      () => _i13.GetFCMStreamUseCase(get<_i11.FCMRepository>()));
  gh.lazySingleton<_i14.HiveBoxes>(() => _i14.HiveBoxes());
  gh.lazySingleton<_i15.ImageResponseMapper>(() => _i15.ImageResponseMapper());
  gh.factory<_i16.MainBloc>(() => _i16.MainBloc());
  gh.lazySingleton<_i17.PreferencesRepository>(
      () => _i18.PreferencesRepositoryImpl(get<_i14.HiveBoxes>()));
  gh.lazySingleton<_i19.ProductMiniResponseMapper>(
      () => _i19.ProductMiniResponseMapper());
  gh.lazySingleton<_i20.ProductPaginationResponseMapper>(() =>
      _i20.ProductPaginationResponseMapper(
          get<_i19.ProductMiniResponseMapper>()));
  gh.lazySingleton<_i21.ProfileResponseMapper>(
      () => _i21.ProfileResponseMapper());
  gh.lazySingleton<_i22.SetPreferenceUseCase>(
      () => _i22.SetPreferenceUseCase(get<_i17.PreferencesRepository>()));
  await gh.lazySingletonAsync<_i23.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i24.SizeResponseMapper>(() => _i24.SizeResponseMapper());
  gh.lazySingleton<_i25.SubcategoryResponseMapper>(
      () => _i25.SubcategoryResponseMapper());
  gh.lazySingleton<_i26.TagResponseMapper>(
      () => _i26.TagResponseMapper(get<_i19.ProductMiniResponseMapper>()));
  gh.lazySingleton<_i27.TokenResponseMapper>(() => _i27.TokenResponseMapper());
  gh.lazySingleton<_i28.AuthInterceptor>(
      () => _i28.AuthInterceptor(get<_i17.PreferencesRepository>()));
  gh.lazySingleton<_i29.GetBoolPreferenceUseCase>(
      () => _i29.GetBoolPreferenceUseCase(get<_i17.PreferencesRepository>()));
  gh.lazySingleton<_i30.GetDoublePreferenceUseCase>(
      () => _i30.GetDoublePreferenceUseCase(get<_i17.PreferencesRepository>()));
  gh.lazySingleton<_i31.GetIntPreferenceUseCase>(
      () => _i31.GetIntPreferenceUseCase(get<_i17.PreferencesRepository>()));
  gh.lazySingleton<_i32.GetStringPreferenceUseCase>(
      () => _i32.GetStringPreferenceUseCase(get<_i17.PreferencesRepository>()));
  gh.lazySingleton<_i33.GroupResponseMapper>(
      () => _i33.GroupResponseMapper(get<_i25.SubcategoryResponseMapper>()));
  gh.lazySingleton<_i34.PlacedOrderItemResponseMapper>(() =>
      _i34.PlacedOrderItemResponseMapper(get<_i19.ProductMiniResponseMapper>(),
          get<_i24.SizeResponseMapper>(), get<_i15.ImageResponseMapper>()));
  gh.lazySingleton<_i35.PlacedOrderResponseMapper>(() =>
      _i35.PlacedOrderResponseMapper(
          get<_i34.PlacedOrderItemResponseMapper>()));
  gh.lazySingleton<_i36.ProductResponseMapper>(() => _i36.ProductResponseMapper(
      get<_i15.ImageResponseMapper>(), get<_i24.SizeResponseMapper>()));
  gh.lazySingleton<_i37.ProfileRepository>(() => _i38.ProfileRepositoryImpl(
      get<_i10.ExceptionHandler>(),
      get<_i8.CommonNetwork>(),
      get<_i27.TokenResponseMapper>(),
      get<_i4.AuthNetwork>(),
      get<_i21.ProfileResponseMapper>(),
      get<_i17.PreferencesRepository>()));
  gh.factory<_i39.StartBloc>(() => _i39.StartBloc(
      get<_i29.GetBoolPreferenceUseCase>(),
      get<_i32.GetStringPreferenceUseCase>(),
      get<_i22.SetPreferenceUseCase>(),
      get<_i13.GetFCMStreamUseCase>()));
  gh.lazySingleton<_i40.AuthUseCase>(
      () => _i40.AuthUseCase(get<_i37.ProfileRepository>()));
  gh.lazySingleton<_i41.CategoryResponseMapper>(
      () => _i41.CategoryResponseMapper(get<_i33.GroupResponseMapper>()));
  gh.lazySingleton<_i42.EditProfileUseCase>(
      () => _i42.EditProfileUseCase(get<_i37.ProfileRepository>()));
  gh.lazySingleton<_i43.FetchProfileUseCase>(
      () => _i43.FetchProfileUseCase(get<_i37.ProfileRepository>()));
  gh.lazySingleton<_i44.OrderRepository>(() => _i45.OrderRepositoryImpl(
      get<_i10.ExceptionHandler>(),
      get<_i4.AuthNetwork>(),
      get<_i35.PlacedOrderResponseMapper>()));
  gh.lazySingleton<_i46.ProductRepository>(() => _i47.ProductRepositoryImpl(
      get<_i10.ExceptionHandler>(),
      get<_i8.CommonNetwork>(),
      get<_i4.AuthNetwork>(),
      get<_i41.CategoryResponseMapper>(),
      get<_i5.BannerResponseMapper>(),
      get<_i26.TagResponseMapper>(),
      get<_i20.ProductPaginationResponseMapper>(),
      get<_i36.ProductResponseMapper>(),
      get<_i24.SizeResponseMapper>(),
      get<_i6.Box<dynamic>>()));
  gh.factory<_i48.ProfileBloc>(() => _i48.ProfileBloc(
      get<_i32.GetStringPreferenceUseCase>(),
      get<_i43.FetchProfileUseCase>(),
      get<_i22.SetPreferenceUseCase>()));
  gh.lazySingleton<_i49.SearchProductsUseCase>(
      () => _i49.SearchProductsUseCase(get<_i46.ProductRepository>()));
  gh.lazySingleton<_i50.ShareProductUseCase>(
      () => _i50.ShareProductUseCase(get<_i46.ProductRepository>()));
  gh.factory<_i51.AuthBloc>(() => _i51.AuthBloc(get<_i40.AuthUseCase>()));
  gh.lazySingleton<_i52.CreateOrderUseCase>(
      () => _i52.CreateOrderUseCase(get<_i44.OrderRepository>()));
  gh.factory<_i53.EditProfileBloc>(
      () => _i53.EditProfileBloc(get<_i42.EditProfileUseCase>()));
  gh.lazySingleton<_i54.FetchCategoriesUseCase>(
      () => _i54.FetchCategoriesUseCase(get<_i46.ProductRepository>()));
  gh.lazySingleton<_i55.FetchFavoriteProductsUseCase>(
      () => _i55.FetchFavoriteProductsUseCase(get<_i46.ProductRepository>()));
  gh.lazySingleton<_i56.FetchHomeUseCase>(
      () => _i56.FetchHomeUseCase(get<_i46.ProductRepository>()));
  gh.lazySingleton<_i57.FetchHotProducts>(
      () => _i57.FetchHotProducts(get<_i46.ProductRepository>()));
  gh.lazySingleton<_i58.FetchPlacedOrdersUseCase>(
      () => _i58.FetchPlacedOrdersUseCase(get<_i44.OrderRepository>()));
  gh.lazySingleton<_i59.FetchProductUseCase>(
      () => _i59.FetchProductUseCase(get<_i46.ProductRepository>()));
  gh.lazySingleton<_i60.FetchProductsUseCase>(
      () => _i60.FetchProductsUseCase(get<_i46.ProductRepository>()));
  gh.lazySingleton<_i61.FetchSubcategorySizesUseCase>(
      () => _i61.FetchSubcategorySizesUseCase(get<_i46.ProductRepository>()));
  gh.factory<_i62.FilterBloc>(
      () => _i62.FilterBloc(get<_i61.FetchSubcategorySizesUseCase>()));
  gh.lazySingleton<_i63.GetPlacedOrderUseCase>(
      () => _i63.GetPlacedOrderUseCase(get<_i44.OrderRepository>()));
  gh.factory<_i64.HomeBloc>(() => _i64.HomeBloc(get<_i56.FetchHomeUseCase>()));
  gh.factory<_i65.HotBloc>(() => _i65.HotBloc(get<_i57.FetchHotProducts>()));
  gh.lazySingleton<_i66.LikeProductUseCase>(
      () => _i66.LikeProductUseCase(get<_i46.ProductRepository>()));
  gh.factory<_i67.PlacedOrderBloc>(
      () => _i67.PlacedOrderBloc(get<_i63.GetPlacedOrderUseCase>()));
  gh.factory<_i68.PlacedOrdersBloc>(
      () => _i68.PlacedOrdersBloc(get<_i58.FetchPlacedOrdersUseCase>()));
  gh.factory<_i69.ProductsBloc>(
      () => _i69.ProductsBloc(get<_i60.FetchProductsUseCase>()));
  gh.factory<_i70.SearchBloc>(
      () => _i70.SearchBloc(get<_i49.SearchProductsUseCase>()));
  gh.factory<_i71.CartBloc>(
      () => _i71.CartBloc(get<_i52.CreateOrderUseCase>()));
  gh.factory<_i72.CategoryBloc>(
      () => _i72.CategoryBloc(get<_i54.FetchCategoriesUseCase>()));
  gh.factory<_i73.DetailBloc>(() => _i73.DetailBloc(
      get<_i59.FetchProductUseCase>(),
      get<_i66.LikeProductUseCase>(),
      get<_i50.ShareProductUseCase>(),
      get<_i48.ProfileBloc>()));
  return get;
}

class _$RegisterModule extends _i74.RegisterModule {}
