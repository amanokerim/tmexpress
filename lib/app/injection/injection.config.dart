// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../../data/error/error_mapper.dart' as _i8;
import '../../data/error/exception_handler.dart' as _i9;
import '../../data/local/preferences.dart' as _i26;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i35;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i23;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i13;
import '../../data/mappers/response_mappers/placed_order_item_response_mapper.dart'
    as _i24;
import '../../data/mappers/response_mappers/placed_order_response_mapper.dart'
    as _i25;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i15;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i16;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i29;
import '../../data/mappers/response_mappers/profile_response_mapper.dart'
    as _i17;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i19;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i20;
import '../../data/mappers/response_mappers/tag_response_mapper.dart' as _i21;
import '../../data/mappers/response_mappers/token_response_mapper.dart' as _i22;
import '../../data/network/auth_interceptor.dart' as _i33;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i7;
import '../../data/repositories/fcm_repository_impl.dart' as _i11;
import '../../data/repositories/order_respository_impl.dart' as _i43;
import '../../data/repositories/preferences_repository_impl.dart' as _i28;
import '../../data/repositories/product_repository_impl.dart' as _i45;
import '../../data/repositories/profile_repository_impl.dart' as _i31;
import '../../domain/repositories/fcm_repository.dart' as _i10;
import '../../domain/repositories/order_repository.dart' as _i42;
import '../../domain/repositories/preferences_repository.dart' as _i27;
import '../../domain/repositories/product_repository.dart' as _i44;
import '../../domain/repositories/profile_repository.dart' as _i30;
import '../../domain/usecases/get_fcm_stream_usecase.dart' as _i12;
import '../../domain/usecases/order/create_order_usecase.dart' as _i50;
import '../../domain/usecases/order/fetch_orders_usecase.dart' as _i56;
import '../../domain/usecases/order/get_placed_order.dart' as _i61;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i38;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i39;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i40;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i41;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i32;
import '../../domain/usecases/products/fetch_categories_usecase.dart' as _i52;
import '../../domain/usecases/products/fetch_favorite_products_usecase.dart'
    as _i53;
import '../../domain/usecases/products/fetch_home_usecase.dart' as _i54;
import '../../domain/usecases/products/fetch_hot_products.dart' as _i55;
import '../../domain/usecases/products/fetch_product_usecase.dart' as _i57;
import '../../domain/usecases/products/fetch_products_usecase.dart' as _i58;
import '../../domain/usecases/products/fetch_subcategory_sizes.dart' as _i59;
import '../../domain/usecases/products/like_product_usecase.dart' as _i64;
import '../../domain/usecases/products/share_product_usecase.dart' as _i47;
import '../../domain/usecases/profile/auth_usecase.dart' as _i34;
import '../../domain/usecases/profile/edit_profile_usecase.dart' as _i36;
import '../../domain/usecases/profile/fetch_profile_usecase.dart' as _i37;
import '../../presentation/screens/auth/bloc/auth_bloc.dart' as _i49;
import '../../presentation/screens/cart/bloc/cart_bloc.dart' as _i68;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i69;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i70;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i62;
import '../../presentation/screens/hot/bloc/hot_bloc.dart' as _i63;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i14;
import '../../presentation/screens/products/bloc/filter/filter_bloc.dart'
    as _i60;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i67;
import '../../presentation/screens/profile/bloc/profile_bloc.dart' as _i46;
import '../../presentation/screens/profile/edit_profile/bloc/edit_profile_bloc.dart'
    as _i51;
import '../../presentation/screens/profile/placed_order/bloc/placed_order_bloc.dart'
    as _i65;
import '../../presentation/screens/profile/placed_orders/bloc/placed_orders_bloc.dart'
    as _i66;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i48;
import 'register_module.dart' as _i71; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.CommonNetwork>(() => registerModule.commonNetwork);
  gh.lazySingleton<_i8.ErrorMapper>(() => _i8.ErrorMapper());
  gh.lazySingleton<_i9.ExceptionHandler>(
      () => _i9.ExceptionHandler(get<_i8.ErrorMapper>()));
  gh.lazySingleton<_i10.FCMRepository>(
      () => _i11.FCMRepositoryImpl(get<_i9.ExceptionHandler>()));
  gh.lazySingleton<_i12.GetFCMStreamUseCase>(
      () => _i12.GetFCMStreamUseCase(get<_i10.FCMRepository>()));
  gh.lazySingleton<_i13.ImageResponseMapper>(() => _i13.ImageResponseMapper());
  gh.factory<_i14.MainBloc>(() => _i14.MainBloc());
  gh.lazySingleton<_i15.ProductMiniResponseMapper>(
      () => _i15.ProductMiniResponseMapper());
  gh.lazySingleton<_i16.ProductPaginationResponseMapper>(() =>
      _i16.ProductPaginationResponseMapper(
          get<_i15.ProductMiniResponseMapper>()));
  gh.lazySingleton<_i17.ProfileResponseMapper>(
      () => _i17.ProfileResponseMapper());
  await gh.lazySingletonAsync<_i18.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i19.SizeResponseMapper>(() => _i19.SizeResponseMapper());
  gh.lazySingleton<_i20.SubcategoryResponseMapper>(
      () => _i20.SubcategoryResponseMapper());
  gh.lazySingleton<_i21.TagResponseMapper>(
      () => _i21.TagResponseMapper(get<_i15.ProductMiniResponseMapper>()));
  gh.lazySingleton<_i22.TokenResponseMapper>(() => _i22.TokenResponseMapper());
  gh.lazySingleton<_i23.GroupResponseMapper>(
      () => _i23.GroupResponseMapper(get<_i20.SubcategoryResponseMapper>()));
  gh.lazySingleton<_i24.PlacedOrderItemResponseMapper>(() =>
      _i24.PlacedOrderItemResponseMapper(get<_i15.ProductMiniResponseMapper>(),
          get<_i19.SizeResponseMapper>(), get<_i13.ImageResponseMapper>()));
  gh.lazySingleton<_i25.PlacedOrderResponseMapper>(() =>
      _i25.PlacedOrderResponseMapper(
          get<_i24.PlacedOrderItemResponseMapper>()));
  gh.lazySingleton<_i26.Preferences>(
      () => _i26.Preferences(get<_i18.SharedPreferences>()));
  gh.lazySingleton<_i27.PreferencesRepository>(() =>
      _i28.PreferencesRepositoryImpl(
          get<_i8.ErrorMapper>(), get<_i26.Preferences>()));
  gh.lazySingleton<_i29.ProductResponseMapper>(() => _i29.ProductResponseMapper(
      get<_i13.ImageResponseMapper>(), get<_i19.SizeResponseMapper>()));
  gh.lazySingleton<_i30.ProfileRepository>(() => _i31.ProfileRepositoryImpl(
      get<_i9.ExceptionHandler>(),
      get<_i7.CommonNetwork>(),
      get<_i26.Preferences>(),
      get<_i22.TokenResponseMapper>(),
      get<_i4.AuthNetwork>(),
      get<_i17.ProfileResponseMapper>()));
  gh.lazySingleton<_i32.SetPreferenceUseCase>(
      () => _i32.SetPreferenceUseCase(get<_i27.PreferencesRepository>()));
  gh.lazySingleton<_i33.AuthInterceptor>(
      () => _i33.AuthInterceptor(get<_i26.Preferences>()));
  gh.lazySingleton<_i34.AuthUseCase>(
      () => _i34.AuthUseCase(get<_i30.ProfileRepository>()));
  gh.lazySingleton<_i35.CategoryResponseMapper>(
      () => _i35.CategoryResponseMapper(get<_i23.GroupResponseMapper>()));
  gh.lazySingleton<_i36.EditProfileUseCase>(
      () => _i36.EditProfileUseCase(get<_i30.ProfileRepository>()));
  gh.lazySingleton<_i37.FetchProfileUseCase>(
      () => _i37.FetchProfileUseCase(get<_i30.ProfileRepository>()));
  gh.lazySingleton<_i38.GetBoolPreferenceUseCase>(
      () => _i38.GetBoolPreferenceUseCase(get<_i27.PreferencesRepository>()));
  gh.lazySingleton<_i39.GetDoublePreferenceUseCase>(
      () => _i39.GetDoublePreferenceUseCase(get<_i27.PreferencesRepository>()));
  gh.lazySingleton<_i40.GetIntPreferenceUseCase>(
      () => _i40.GetIntPreferenceUseCase(get<_i27.PreferencesRepository>()));
  gh.lazySingleton<_i41.GetStringPreferenceUseCase>(
      () => _i41.GetStringPreferenceUseCase(get<_i27.PreferencesRepository>()));
  gh.lazySingleton<_i42.OrderRepository>(() => _i43.OrderRepositoryImpl(
      get<_i9.ExceptionHandler>(),
      get<_i4.AuthNetwork>(),
      get<_i25.PlacedOrderResponseMapper>()));
  gh.lazySingleton<_i44.ProductRepository>(() => _i45.ProductRepositoryImpl(
      get<_i9.ExceptionHandler>(),
      get<_i7.CommonNetwork>(),
      get<_i4.AuthNetwork>(),
      get<_i35.CategoryResponseMapper>(),
      get<_i5.BannerResponseMapper>(),
      get<_i21.TagResponseMapper>(),
      get<_i16.ProductPaginationResponseMapper>(),
      get<_i29.ProductResponseMapper>(),
      get<_i19.SizeResponseMapper>(),
      get<_i6.Box<Map<dynamic, dynamic>>>()));
  gh.factory<_i46.ProfileBloc>(() => _i46.ProfileBloc(
      get<_i41.GetStringPreferenceUseCase>(),
      get<_i37.FetchProfileUseCase>(),
      get<_i32.SetPreferenceUseCase>()));
  gh.lazySingleton<_i47.ShareProductUseCase>(
      () => _i47.ShareProductUseCase(get<_i44.ProductRepository>()));
  gh.factory<_i48.StartBloc>(() => _i48.StartBloc(
      get<_i38.GetBoolPreferenceUseCase>(),
      get<_i41.GetStringPreferenceUseCase>(),
      get<_i32.SetPreferenceUseCase>(),
      get<_i12.GetFCMStreamUseCase>()));
  gh.factory<_i49.AuthBloc>(() => _i49.AuthBloc(get<_i34.AuthUseCase>()));
  gh.lazySingleton<_i50.CreateOrderUseCase>(
      () => _i50.CreateOrderUseCase(get<_i42.OrderRepository>()));
  gh.factory<_i51.EditProfileBloc>(
      () => _i51.EditProfileBloc(get<_i36.EditProfileUseCase>()));
  gh.lazySingleton<_i52.FetchCategoriesUseCase>(
      () => _i52.FetchCategoriesUseCase(get<_i44.ProductRepository>()));
  gh.lazySingleton<_i53.FetchFavoriteProductsUseCase>(
      () => _i53.FetchFavoriteProductsUseCase(get<_i44.ProductRepository>()));
  gh.lazySingleton<_i54.FetchHomeUseCase>(
      () => _i54.FetchHomeUseCase(get<_i44.ProductRepository>()));
  gh.lazySingleton<_i55.FetchHotProducts>(
      () => _i55.FetchHotProducts(get<_i44.ProductRepository>()));
  gh.lazySingleton<_i56.FetchPlacedOrdersUseCase>(
      () => _i56.FetchPlacedOrdersUseCase(get<_i42.OrderRepository>()));
  gh.lazySingleton<_i57.FetchProductUseCase>(
      () => _i57.FetchProductUseCase(get<_i44.ProductRepository>()));
  gh.lazySingleton<_i58.FetchProductsUseCase>(
      () => _i58.FetchProductsUseCase(get<_i44.ProductRepository>()));
  gh.lazySingleton<_i59.FetchSubcategorySizesUseCase>(
      () => _i59.FetchSubcategorySizesUseCase(get<_i44.ProductRepository>()));
  gh.factory<_i60.FilterBloc>(
      () => _i60.FilterBloc(get<_i59.FetchSubcategorySizesUseCase>()));
  gh.lazySingleton<_i61.GetPlacedOrderUseCase>(
      () => _i61.GetPlacedOrderUseCase(get<_i42.OrderRepository>()));
  gh.factory<_i62.HomeBloc>(() => _i62.HomeBloc(get<_i54.FetchHomeUseCase>()));
  gh.factory<_i63.HotBloc>(() => _i63.HotBloc(get<_i55.FetchHotProducts>()));
  gh.lazySingleton<_i64.LikeProductUseCase>(
      () => _i64.LikeProductUseCase(get<_i44.ProductRepository>()));
  gh.factory<_i65.PlacedOrderBloc>(
      () => _i65.PlacedOrderBloc(get<_i61.GetPlacedOrderUseCase>()));
  gh.factory<_i66.PlacedOrdersBloc>(
      () => _i66.PlacedOrdersBloc(get<_i56.FetchPlacedOrdersUseCase>()));
  gh.factory<_i67.ProductsBloc>(
      () => _i67.ProductsBloc(get<_i58.FetchProductsUseCase>()));
  gh.factory<_i68.CartBloc>(
      () => _i68.CartBloc(get<_i50.CreateOrderUseCase>()));
  gh.factory<_i69.CategoryBloc>(
      () => _i69.CategoryBloc(get<_i52.FetchCategoriesUseCase>()));
  gh.factory<_i70.DetailBloc>(() => _i70.DetailBloc(
      get<_i57.FetchProductUseCase>(),
      get<_i64.LikeProductUseCase>(),
      get<_i47.ShareProductUseCase>(),
      get<_i46.ProfileBloc>()));
  return get;
}

class _$RegisterModule extends _i71.RegisterModule {}
