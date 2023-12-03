// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alice/alice.dart' as _i3;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i20;

import '../../data/error/error_mapper.dart' as _i9;
import '../../data/error/exception_handler.dart' as _i10;
import '../../data/local/hive_boxes.dart' as _i11;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i40;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i31;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i12;
import '../../data/mappers/response_mappers/placed_order_item_response_mapper.dart'
    as _i32;
import '../../data/mappers/response_mappers/placed_order_response_mapper.dart'
    as _i33;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i16;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i17;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i34;
import '../../data/mappers/response_mappers/profile_response_mapper.dart'
    as _i18;
import '../../data/mappers/response_mappers/shipping_option_pagination_response_mapper.dart'
    as _i37;
import '../../data/mappers/response_mappers/shipping_option_response_mapper.dart'
    as _i21;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i22;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i23;
import '../../data/mappers/response_mappers/tag_response_mapper.dart' as _i24;
import '../../data/mappers/response_mappers/token_response_mapper.dart' as _i25;
import '../../data/network/auth_interceptor.dart' as _i26;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i8;
import '../../data/repositories/order_respository_impl.dart' as _i44;
import '../../data/repositories/preferences_repository_impl.dart' as _i15;
import '../../data/repositories/product_repository_impl.dart' as _i46;
import '../../data/repositories/profile_repository_impl.dart' as _i36;
import '../../domain/repositories/order_repository.dart' as _i43;
import '../../domain/repositories/preferences_repository.dart' as _i14;
import '../../domain/repositories/product_repository.dart' as _i45;
import '../../domain/repositories/profile_repository.dart' as _i35;
import '../../domain/usecases/order/create_order_usecase.dart' as _i51;
import '../../domain/usecases/order/fetch_orders_usecase.dart' as _i57;
import '../../domain/usecases/order/fetch_shipping_options.dart' as _i60;
import '../../domain/usecases/order/get_placed_order.dart' as _i63;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i27;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i28;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i29;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i30;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i19;
import '../../domain/usecases/products/fetch_categories_usecase.dart' as _i53;
import '../../domain/usecases/products/fetch_favorite_products_usecase.dart'
    as _i54;
import '../../domain/usecases/products/fetch_home_usecase.dart' as _i55;
import '../../domain/usecases/products/fetch_hot_products.dart' as _i56;
import '../../domain/usecases/products/fetch_product_usecase.dart' as _i58;
import '../../domain/usecases/products/fetch_products_usecase.dart' as _i59;
import '../../domain/usecases/products/fetch_subcategory_sizes.dart' as _i61;
import '../../domain/usecases/products/like_product_usecase.dart' as _i66;
import '../../domain/usecases/products/search_product_usecase.dart' as _i48;
import '../../domain/usecases/products/share_product_usecase.dart' as _i49;
import '../../domain/usecases/profile/auth_usecase.dart' as _i39;
import '../../domain/usecases/profile/edit_profile_usecase.dart' as _i41;
import '../../domain/usecases/profile/fetch_profile_usecase.dart' as _i42;
import '../../presentation/screens/auth/bloc/auth_bloc.dart' as _i50;
import '../../presentation/screens/cart/bloc/cart_bloc.dart' as _i72;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i73;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i74;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i64;
import '../../presentation/screens/home/search/bloc/search_bloc.dart' as _i70;
import '../../presentation/screens/hot/bloc/hot_bloc.dart' as _i65;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i13;
import '../../presentation/screens/products/bloc/filter/filter_bloc.dart'
    as _i62;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i69;
import '../../presentation/screens/profile/bloc/profile_bloc.dart' as _i47;
import '../../presentation/screens/profile/edit_profile/bloc/edit_profile_bloc.dart'
    as _i52;
import '../../presentation/screens/profile/placed_order/bloc/placed_order_bloc.dart'
    as _i67;
import '../../presentation/screens/profile/placed_orders/bloc/placed_orders_bloc.dart'
    as _i68;
import '../../presentation/screens/shipping_options/bloc/shipping_options_bloc.dart'
    as _i71;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i38;
import 'register_module.dart' as _i75;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Alice>(() => registerModule.alice);
    gh.lazySingleton<_i4.AuthNetwork>(() => registerModule.authNetwork);
    gh.lazySingleton<_i5.BannerResponseMapper>(
        () => _i5.BannerResponseMapper());
    gh.lazySingleton<_i6.Box<Map<dynamic, dynamic>>>(
        () => registerModule.favoritesBox);
    gh.lazySingleton<_i7.CacheOptions>(() => registerModule.cacheOption);
    gh.lazySingleton<_i8.CommonNetwork>(() => registerModule.commonNetwork);
    gh.lazySingleton<_i9.ErrorMapper>(() => _i9.ErrorMapper());
    gh.lazySingleton<_i10.ExceptionHandler>(
        () => _i10.ExceptionHandler(gh<_i9.ErrorMapper>()));
    gh.lazySingleton<_i11.HiveBoxes>(() => _i11.HiveBoxes());
    gh.lazySingleton<_i12.ImageResponseMapper>(
        () => _i12.ImageResponseMapper());
    gh.factory<_i13.MainBloc>(() => _i13.MainBloc());
    gh.lazySingleton<_i14.PreferencesRepository>(
        () => _i15.PreferencesRepositoryImpl());
    gh.lazySingleton<_i16.ProductMiniResponseMapper>(
        () => _i16.ProductMiniResponseMapper());
    gh.lazySingleton<_i17.ProductPaginationResponseMapper>(() =>
        _i17.ProductPaginationResponseMapper(
            gh<_i16.ProductMiniResponseMapper>()));
    gh.lazySingleton<_i18.ProfileResponseMapper>(
        () => _i18.ProfileResponseMapper());
    gh.lazySingleton<_i19.SetPreferenceUseCase>(
        () => _i19.SetPreferenceUseCase(gh<_i14.PreferencesRepository>()));
    await gh.lazySingletonAsync<_i20.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i21.ShippingOptionResponseMapper>(
        () => _i21.ShippingOptionResponseMapper());
    gh.lazySingleton<_i22.SizeResponseMapper>(() => _i22.SizeResponseMapper());
    gh.lazySingleton<_i23.SubcategoryResponseMapper>(
        () => _i23.SubcategoryResponseMapper());
    gh.lazySingleton<_i24.TagResponseMapper>(
        () => _i24.TagResponseMapper(gh<_i16.ProductMiniResponseMapper>()));
    gh.lazySingleton<_i25.TokenResponseMapper>(
        () => _i25.TokenResponseMapper());
    gh.lazySingleton<_i26.AuthInterceptor>(
        () => _i26.AuthInterceptor(gh<_i14.PreferencesRepository>()));
    gh.lazySingleton<_i27.GetBoolPreferenceUseCase>(
        () => _i27.GetBoolPreferenceUseCase(gh<_i14.PreferencesRepository>()));
    gh.lazySingleton<_i28.GetDoublePreferenceUseCase>(() =>
        _i28.GetDoublePreferenceUseCase(gh<_i14.PreferencesRepository>()));
    gh.lazySingleton<_i29.GetIntPreferenceUseCase>(
        () => _i29.GetIntPreferenceUseCase(gh<_i14.PreferencesRepository>()));
    gh.lazySingleton<_i30.GetStringPreferenceUseCase>(() =>
        _i30.GetStringPreferenceUseCase(gh<_i14.PreferencesRepository>()));
    gh.lazySingleton<_i31.GroupResponseMapper>(
        () => _i31.GroupResponseMapper(gh<_i23.SubcategoryResponseMapper>()));
    gh.lazySingleton<_i32.PlacedOrderItemResponseMapper>(
        () => _i32.PlacedOrderItemResponseMapper(
              gh<_i16.ProductMiniResponseMapper>(),
              gh<_i22.SizeResponseMapper>(),
              gh<_i12.ImageResponseMapper>(),
            ));
    gh.lazySingleton<_i33.PlacedOrderResponseMapper>(() =>
        _i33.PlacedOrderResponseMapper(
            gh<_i32.PlacedOrderItemResponseMapper>()));
    gh.lazySingleton<_i34.ProductResponseMapper>(
        () => _i34.ProductResponseMapper(
              gh<_i12.ImageResponseMapper>(),
              gh<_i22.SizeResponseMapper>(),
            ));
    gh.lazySingleton<_i35.ProfileRepository>(() => _i36.ProfileRepositoryImpl(
          gh<_i10.ExceptionHandler>(),
          gh<_i8.CommonNetwork>(),
          gh<_i25.TokenResponseMapper>(),
          gh<_i4.AuthNetwork>(),
          gh<_i18.ProfileResponseMapper>(),
          gh<_i14.PreferencesRepository>(),
        ));
    gh.lazySingleton<_i37.ShippingOptionPaginationResponseMapper>(() =>
        _i37.ShippingOptionPaginationResponseMapper(
            gh<_i21.ShippingOptionResponseMapper>()));
    gh.factory<_i38.StartBloc>(() => _i38.StartBloc(
          gh<_i27.GetBoolPreferenceUseCase>(),
          gh<_i30.GetStringPreferenceUseCase>(),
          gh<_i19.SetPreferenceUseCase>(),
        ));
    gh.lazySingleton<_i39.AuthUseCase>(
        () => _i39.AuthUseCase(gh<_i35.ProfileRepository>()));
    gh.lazySingleton<_i40.CategoryResponseMapper>(
        () => _i40.CategoryResponseMapper(gh<_i31.GroupResponseMapper>()));
    gh.lazySingleton<_i41.EditProfileUseCase>(
        () => _i41.EditProfileUseCase(gh<_i35.ProfileRepository>()));
    gh.lazySingleton<_i42.FetchProfileUseCase>(
        () => _i42.FetchProfileUseCase(gh<_i35.ProfileRepository>()));
    gh.lazySingleton<_i43.OrderRepository>(() => _i44.OrderRepositoryImpl(
          gh<_i10.ExceptionHandler>(),
          gh<_i4.AuthNetwork>(),
          gh<_i33.PlacedOrderResponseMapper>(),
          gh<_i8.CommonNetwork>(),
          gh<_i37.ShippingOptionPaginationResponseMapper>(),
        ));
    gh.lazySingleton<_i45.ProductRepository>(() => _i46.ProductRepositoryImpl(
          gh<_i10.ExceptionHandler>(),
          gh<_i8.CommonNetwork>(),
          gh<_i4.AuthNetwork>(),
          gh<_i40.CategoryResponseMapper>(),
          gh<_i5.BannerResponseMapper>(),
          gh<_i24.TagResponseMapper>(),
          gh<_i17.ProductPaginationResponseMapper>(),
          gh<_i34.ProductResponseMapper>(),
          gh<_i22.SizeResponseMapper>(),
          gh<_i6.Box<Map<dynamic, dynamic>>>(),
        ));
    gh.factory<_i47.ProfileBloc>(() => _i47.ProfileBloc(
          gh<_i30.GetStringPreferenceUseCase>(),
          gh<_i42.FetchProfileUseCase>(),
          gh<_i19.SetPreferenceUseCase>(),
        ));
    gh.lazySingleton<_i48.SearchProductsUseCase>(
        () => _i48.SearchProductsUseCase(gh<_i45.ProductRepository>()));
    gh.lazySingleton<_i49.ShareProductUseCase>(
        () => _i49.ShareProductUseCase(gh<_i45.ProductRepository>()));
    gh.factory<_i50.AuthBloc>(() => _i50.AuthBloc(gh<_i39.AuthUseCase>()));
    gh.lazySingleton<_i51.CreateOrderUseCase>(
        () => _i51.CreateOrderUseCase(gh<_i43.OrderRepository>()));
    gh.factory<_i52.EditProfileBloc>(
        () => _i52.EditProfileBloc(gh<_i41.EditProfileUseCase>()));
    gh.lazySingleton<_i53.FetchCategoriesUseCase>(
        () => _i53.FetchCategoriesUseCase(gh<_i45.ProductRepository>()));
    gh.lazySingleton<_i54.FetchFavoriteProductsUseCase>(
        () => _i54.FetchFavoriteProductsUseCase(gh<_i45.ProductRepository>()));
    gh.lazySingleton<_i55.FetchHomeUseCase>(
        () => _i55.FetchHomeUseCase(gh<_i45.ProductRepository>()));
    gh.lazySingleton<_i56.FetchHotProducts>(
        () => _i56.FetchHotProducts(gh<_i45.ProductRepository>()));
    gh.lazySingleton<_i57.FetchPlacedOrdersUseCase>(
        () => _i57.FetchPlacedOrdersUseCase(gh<_i43.OrderRepository>()));
    gh.lazySingleton<_i58.FetchProductUseCase>(
        () => _i58.FetchProductUseCase(gh<_i45.ProductRepository>()));
    gh.lazySingleton<_i59.FetchProductsUseCase>(
        () => _i59.FetchProductsUseCase(gh<_i45.ProductRepository>()));
    gh.lazySingleton<_i60.FetchShippingOptions>(
        () => _i60.FetchShippingOptions(gh<_i43.OrderRepository>()));
    gh.lazySingleton<_i61.FetchSubcategorySizesUseCase>(
        () => _i61.FetchSubcategorySizesUseCase(gh<_i45.ProductRepository>()));
    gh.factory<_i62.FilterBloc>(
        () => _i62.FilterBloc(gh<_i61.FetchSubcategorySizesUseCase>()));
    gh.lazySingleton<_i63.GetPlacedOrderUseCase>(
        () => _i63.GetPlacedOrderUseCase(gh<_i43.OrderRepository>()));
    gh.factory<_i64.HomeBloc>(() => _i64.HomeBloc(gh<_i55.FetchHomeUseCase>()));
    gh.factory<_i65.HotBloc>(() => _i65.HotBloc(gh<_i56.FetchHotProducts>()));
    gh.lazySingleton<_i66.LikeProductUseCase>(
        () => _i66.LikeProductUseCase(gh<_i45.ProductRepository>()));
    gh.factory<_i67.PlacedOrderBloc>(
        () => _i67.PlacedOrderBloc(gh<_i63.GetPlacedOrderUseCase>()));
    gh.factory<_i68.PlacedOrdersBloc>(
        () => _i68.PlacedOrdersBloc(gh<_i57.FetchPlacedOrdersUseCase>()));
    gh.factory<_i69.ProductsBloc>(
        () => _i69.ProductsBloc(gh<_i59.FetchProductsUseCase>()));
    gh.factory<_i70.SearchBloc>(
        () => _i70.SearchBloc(gh<_i48.SearchProductsUseCase>()));
    gh.factory<_i71.ShippingOptionsBloc>(
        () => _i71.ShippingOptionsBloc(gh<_i60.FetchShippingOptions>()));
    gh.factory<_i72.CartBloc>(
        () => _i72.CartBloc(gh<_i51.CreateOrderUseCase>()));
    gh.factory<_i73.CategoryBloc>(
        () => _i73.CategoryBloc(gh<_i53.FetchCategoriesUseCase>()));
    gh.factory<_i74.DetailBloc>(() => _i74.DetailBloc(
          gh<_i58.FetchProductUseCase>(),
          gh<_i66.LikeProductUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i75.RegisterModule {}
