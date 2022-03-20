// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:alice/alice.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../../data/error/error_mapper.dart' as _i8;
import '../../data/error/exception_handler.dart' as _i9;
import '../../data/local/preferences.dart' as _i23;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i32;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i20;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i10;
import '../../data/mappers/response_mappers/placed_order_item_response_mapper.dart'
    as _i21;
import '../../data/mappers/response_mappers/placed_order_response_mapper.dart'
    as _i22;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i12;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i13;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i26;
import '../../data/mappers/response_mappers/profile_response_mapper.dart'
    as _i14;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i16;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i17;
import '../../data/mappers/response_mappers/tag_response_mapper.dart' as _i18;
import '../../data/mappers/response_mappers/token_response_mapper.dart' as _i19;
import '../../data/network/auth_interceptor.dart' as _i30;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i7;
import '../../data/repositories/order_respository_impl.dart' as _i40;
import '../../data/repositories/preferences_repository_impl.dart' as _i25;
import '../../data/repositories/product_repository_impl.dart' as _i42;
import '../../data/repositories/profile_repository_impl.dart' as _i28;
import '../../domain/repositories/order_repository.dart' as _i39;
import '../../domain/repositories/preferences_repository.dart' as _i24;
import '../../domain/repositories/product_repository.dart' as _i41;
import '../../domain/repositories/profile_repository.dart' as _i27;
import '../../domain/usecases/order/create_order_usecase.dart' as _i47;
import '../../domain/usecases/order/fetch_orders_usecase.dart' as _i53;
import '../../domain/usecases/order/get_placed_order.dart' as _i58;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i35;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i36;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i37;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i38;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i29;
import '../../domain/usecases/products/fetch_categories_usecase.dart' as _i49;
import '../../domain/usecases/products/fetch_favorite_products_usecase.dart'
    as _i50;
import '../../domain/usecases/products/fetch_home_usecase.dart' as _i51;
import '../../domain/usecases/products/fetch_hot_products.dart' as _i52;
import '../../domain/usecases/products/fetch_product_usecase.dart' as _i54;
import '../../domain/usecases/products/fetch_products_usecase.dart' as _i55;
import '../../domain/usecases/products/fetch_subcategory_sizes.dart' as _i56;
import '../../domain/usecases/products/like_product_usecase.dart' as _i61;
import '../../domain/usecases/products/share_product_usecase.dart' as _i44;
import '../../domain/usecases/profile/auth_usecase.dart' as _i31;
import '../../domain/usecases/profile/edit_profile_usecase.dart' as _i33;
import '../../domain/usecases/profile/fetch_profile_usecase.dart' as _i34;
import '../../presentation/screens/auth/bloc/auth_bloc.dart' as _i46;
import '../../presentation/screens/cart/bloc/cart_bloc.dart' as _i65;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i66;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i67;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i59;
import '../../presentation/screens/hot/bloc/hot_bloc.dart' as _i60;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i11;
import '../../presentation/screens/products/bloc/filter/filter_bloc.dart'
    as _i57;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i64;
import '../../presentation/screens/profile/bloc/profile_bloc.dart' as _i43;
import '../../presentation/screens/profile/edit_profile/bloc/edit_profile_bloc.dart'
    as _i48;
import '../../presentation/screens/profile/placed_order/bloc/placed_order_bloc.dart'
    as _i62;
import '../../presentation/screens/profile/placed_orders/bloc/placed_orders_bloc.dart'
    as _i63;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i45;
import 'register_module.dart' as _i68; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i21.PlacedOrderItemResponseMapper>(() =>
      _i21.PlacedOrderItemResponseMapper(get<_i12.ProductMiniResponseMapper>(),
          get<_i16.SizeResponseMapper>(), get<_i10.ImageResponseMapper>()));
  gh.lazySingleton<_i22.PlacedOrderResponseMapper>(() =>
      _i22.PlacedOrderResponseMapper(
          get<_i21.PlacedOrderItemResponseMapper>()));
  gh.lazySingleton<_i23.Preferences>(
      () => _i23.Preferences(get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i24.PreferencesRepository>(() =>
      _i25.PreferencesRepositoryImpl(
          get<_i8.ErrorMapper>(), get<_i23.Preferences>()));
  gh.lazySingleton<_i26.ProductResponseMapper>(() => _i26.ProductResponseMapper(
      get<_i10.ImageResponseMapper>(), get<_i16.SizeResponseMapper>()));
  gh.lazySingleton<_i27.ProfileRepository>(() => _i28.ProfileRepositoryImpl(
      get<_i9.ExceptionHandler>(),
      get<_i7.CommonNetwork>(),
      get<_i23.Preferences>(),
      get<_i19.TokenResponseMapper>(),
      get<_i4.AuthNetwork>(),
      get<_i14.ProfileResponseMapper>()));
  gh.lazySingleton<_i29.SetPreferenceUseCase>(
      () => _i29.SetPreferenceUseCase(get<_i24.PreferencesRepository>()));
  gh.lazySingleton<_i30.AuthInterceptor>(
      () => _i30.AuthInterceptor(get<_i23.Preferences>()));
  gh.lazySingleton<_i31.AuthUseCase>(
      () => _i31.AuthUseCase(get<_i27.ProfileRepository>()));
  gh.lazySingleton<_i32.CategoryResponseMapper>(
      () => _i32.CategoryResponseMapper(get<_i20.GroupResponseMapper>()));
  gh.lazySingleton<_i33.EditProfileUseCase>(
      () => _i33.EditProfileUseCase(get<_i27.ProfileRepository>()));
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
  gh.lazySingleton<_i39.OrderRepository>(() => _i40.OrderRepositoryImpl(
      get<_i9.ExceptionHandler>(),
      get<_i4.AuthNetwork>(),
      get<_i22.PlacedOrderResponseMapper>()));
  gh.lazySingleton<_i41.ProductRepository>(() => _i42.ProductRepositoryImpl(
      get<_i9.ExceptionHandler>(),
      get<_i7.CommonNetwork>(),
      get<_i4.AuthNetwork>(),
      get<_i32.CategoryResponseMapper>(),
      get<_i5.BannerResponseMapper>(),
      get<_i18.TagResponseMapper>(),
      get<_i13.ProductPaginationResponseMapper>(),
      get<_i26.ProductResponseMapper>(),
      get<_i16.SizeResponseMapper>(),
      get<_i6.Box<Map<dynamic, dynamic>>>()));
  gh.factory<_i43.ProfileBloc>(() => _i43.ProfileBloc(
      get<_i38.GetStringPreferenceUseCase>(), get<_i34.FetchProfileUseCase>()));
  gh.lazySingleton<_i44.ShareProductUseCase>(
      () => _i44.ShareProductUseCase(get<_i41.ProductRepository>()));
  gh.factory<_i45.StartBloc>(() => _i45.StartBloc(
      get<_i35.GetBoolPreferenceUseCase>(),
      get<_i38.GetStringPreferenceUseCase>(),
      get<_i29.SetPreferenceUseCase>()));
  gh.factory<_i46.AuthBloc>(() => _i46.AuthBloc(get<_i31.AuthUseCase>()));
  gh.lazySingleton<_i47.CreateOrderUseCase>(
      () => _i47.CreateOrderUseCase(get<_i39.OrderRepository>()));
  gh.factory<_i48.EditProfileBloc>(
      () => _i48.EditProfileBloc(get<_i33.EditProfileUseCase>()));
  gh.lazySingleton<_i49.FetchCategoriesUseCase>(
      () => _i49.FetchCategoriesUseCase(get<_i41.ProductRepository>()));
  gh.lazySingleton<_i50.FetchFavoriteProductsUseCase>(
      () => _i50.FetchFavoriteProductsUseCase(get<_i41.ProductRepository>()));
  gh.lazySingleton<_i51.FetchHomeUseCase>(
      () => _i51.FetchHomeUseCase(get<_i41.ProductRepository>()));
  gh.lazySingleton<_i52.FetchHotProducts>(
      () => _i52.FetchHotProducts(get<_i41.ProductRepository>()));
  gh.lazySingleton<_i53.FetchPlacedOrdersUseCase>(
      () => _i53.FetchPlacedOrdersUseCase(get<_i39.OrderRepository>()));
  gh.lazySingleton<_i54.FetchProductUseCase>(
      () => _i54.FetchProductUseCase(get<_i41.ProductRepository>()));
  gh.lazySingleton<_i55.FetchProductsUseCase>(
      () => _i55.FetchProductsUseCase(get<_i41.ProductRepository>()));
  gh.lazySingleton<_i56.FetchSubcategorySizesUseCase>(
      () => _i56.FetchSubcategorySizesUseCase(get<_i41.ProductRepository>()));
  gh.factory<_i57.FilterBloc>(
      () => _i57.FilterBloc(get<_i56.FetchSubcategorySizesUseCase>()));
  gh.lazySingleton<_i58.GetPlacedOrderUseCase>(
      () => _i58.GetPlacedOrderUseCase(get<_i39.OrderRepository>()));
  gh.factory<_i59.HomeBloc>(() => _i59.HomeBloc(get<_i51.FetchHomeUseCase>()));
  gh.factory<_i60.HotBloc>(() => _i60.HotBloc(get<_i52.FetchHotProducts>()));
  gh.lazySingleton<_i61.LikeProductUseCase>(
      () => _i61.LikeProductUseCase(get<_i41.ProductRepository>()));
  gh.factory<_i62.PlacedOrderBloc>(
      () => _i62.PlacedOrderBloc(get<_i58.GetPlacedOrderUseCase>()));
  gh.factory<_i63.PlacedOrdersBloc>(
      () => _i63.PlacedOrdersBloc(get<_i53.FetchPlacedOrdersUseCase>()));
  gh.factory<_i64.ProductsBloc>(
      () => _i64.ProductsBloc(get<_i55.FetchProductsUseCase>()));
  gh.factory<_i65.CartBloc>(
      () => _i65.CartBloc(get<_i47.CreateOrderUseCase>()));
  gh.factory<_i66.CategoryBloc>(
      () => _i66.CategoryBloc(get<_i49.FetchCategoriesUseCase>()));
  gh.factory<_i67.DetailBloc>(() => _i67.DetailBloc(
      get<_i54.FetchProductUseCase>(),
      get<_i61.LikeProductUseCase>(),
      get<_i44.ShareProductUseCase>()));
  return get;
}

class _$RegisterModule extends _i68.RegisterModule {}
