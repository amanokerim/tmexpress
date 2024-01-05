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
import 'package:shared_preferences/shared_preferences.dart' as _i23;

import '../../data/error/error_mapper.dart' as _i9;
import '../../data/error/exception_handler.dart' as _i10;
import '../../data/local/hive_boxes.dart' as _i11;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i5;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i46;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i34;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i12;
import '../../data/mappers/response_mappers/media_pagination_response_mapper.dart'
    as _i20;
import '../../data/mappers/response_mappers/placed_order_item_response_mapper.dart'
    as _i38;
import '../../data/mappers/response_mappers/placed_order_response_mapper.dart'
    as _i39;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i18;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i19;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i40;
import '../../data/mappers/response_mappers/profile_response_mapper.dart'
    as _i21;
import '../../data/mappers/response_mappers/shipping_option_pagination_response_mapper.dart'
    as _i43;
import '../../data/mappers/response_mappers/shipping_option_response_mapper.dart'
    as _i24;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i25;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i26;
import '../../data/mappers/response_mappers/tag_response_mapper.dart' as _i27;
import '../../data/mappers/response_mappers/token_response_mapper.dart' as _i28;
import '../../data/network/auth_interceptor.dart' as _i29;
import '../../data/network/auth_network.dart' as _i4;
import '../../data/network/common_network.dart' as _i8;
import '../../data/repositories/media_repository_impl.dart' as _i15;
import '../../data/repositories/order_respository_impl.dart' as _i50;
import '../../data/repositories/preferences_repository_impl.dart' as _i17;
import '../../data/repositories/product_repository_impl.dart' as _i52;
import '../../data/repositories/profile_repository_impl.dart' as _i42;
import '../../domain/repositories/media_repository.dart' as _i14;
import '../../domain/repositories/order_repository.dart' as _i49;
import '../../domain/repositories/preferences_repository.dart' as _i16;
import '../../domain/repositories/product_repository.dart' as _i51;
import '../../domain/repositories/profile_repository.dart' as _i41;
import '../../domain/usecases/order/create_order_usecase.dart' as _i57;
import '../../domain/usecases/order/fetch_orders_usecase.dart' as _i63;
import '../../domain/usecases/order/fetch_shipping_options.dart' as _i66;
import '../../domain/usecases/order/get_placed_order.dart' as _i69;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i30;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i31;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i32;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i33;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i22;
import '../../domain/usecases/products/fetch_categories_usecase.dart' as _i59;
import '../../domain/usecases/products/fetch_favorite_products_usecase.dart'
    as _i60;
import '../../domain/usecases/products/fetch_home_usecase.dart' as _i61;
import '../../domain/usecases/products/fetch_hot_products.dart' as _i62;
import '../../domain/usecases/products/fetch_product_usecase.dart' as _i64;
import '../../domain/usecases/products/fetch_products_usecase.dart' as _i65;
import '../../domain/usecases/products/fetch_subcategory_sizes.dart' as _i67;
import '../../domain/usecases/products/like_product_usecase.dart' as _i72;
import '../../domain/usecases/products/search_product_usecase.dart' as _i54;
import '../../domain/usecases/products/share_product_usecase.dart' as _i55;
import '../../domain/usecases/profile/auth_usecase.dart' as _i45;
import '../../domain/usecases/profile/edit_profile_usecase.dart' as _i47;
import '../../domain/usecases/profile/fetch_profile_usecase.dart' as _i48;
import '../../presentation/screens/auth/bloc/auth_bloc.dart' as _i56;
import '../../presentation/screens/cart/bloc/cart_bloc.dart' as _i78;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i79;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i80;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i70;
import '../../presentation/screens/home/search/bloc/search_bloc.dart' as _i76;
import '../../presentation/screens/hot/bloc/hot_bloc.dart' as _i71;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i13;
import '../../presentation/screens/media/bloc/media_list_bloc.dart' as _i37;
import '../../presentation/screens/media/cubit/media_category_cubit.dart'
    as _i35;
import '../../presentation/screens/media/media_detail/cubit/media_cubit.dart'
    as _i36;
import '../../presentation/screens/products/bloc/filter/filter_bloc.dart'
    as _i68;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i75;
import '../../presentation/screens/profile/bloc/profile_bloc.dart' as _i53;
import '../../presentation/screens/profile/edit_profile/bloc/edit_profile_bloc.dart'
    as _i58;
import '../../presentation/screens/profile/placed_order/bloc/placed_order_bloc.dart'
    as _i73;
import '../../presentation/screens/profile/placed_orders/bloc/placed_orders_bloc.dart'
    as _i74;
import '../../presentation/screens/shipping_options/bloc/shipping_options_bloc.dart'
    as _i77;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i44;
import 'register_module.dart' as _i81;

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
    gh.lazySingleton<_i14.MediaRepository>(() => _i15.MediaRepositoryImpl(
          gh<_i10.ExceptionHandler>(),
          gh<_i8.CommonNetwork>(),
          gh<_i6.Box<Map<dynamic, dynamic>>>(),
        ));
    gh.lazySingleton<_i16.PreferencesRepository>(
        () => _i17.PreferencesRepositoryImpl());
    gh.lazySingleton<_i18.ProductMiniResponseMapper>(
        () => _i18.ProductMiniResponseMapper());
    gh.lazySingleton<_i19.ProductPaginationResponseMapper>(() =>
        _i19.ProductPaginationResponseMapper(
            gh<_i18.ProductMiniResponseMapper>()));
    gh.lazySingleton<_i20.ProductPaginationResponseMapper>(() =>
        _i20.ProductPaginationResponseMapper(
            gh<_i18.ProductMiniResponseMapper>()));
    gh.lazySingleton<_i21.ProfileResponseMapper>(
        () => _i21.ProfileResponseMapper());
    gh.lazySingleton<_i22.SetPreferenceUseCase>(
        () => _i22.SetPreferenceUseCase(gh<_i16.PreferencesRepository>()));
    await gh.lazySingletonAsync<_i23.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i24.ShippingOptionResponseMapper>(
        () => _i24.ShippingOptionResponseMapper());
    gh.lazySingleton<_i25.SizeResponseMapper>(() => _i25.SizeResponseMapper());
    gh.lazySingleton<_i26.SubcategoryResponseMapper>(
        () => _i26.SubcategoryResponseMapper());
    gh.lazySingleton<_i27.TagResponseMapper>(
        () => _i27.TagResponseMapper(gh<_i18.ProductMiniResponseMapper>()));
    gh.lazySingleton<_i28.TokenResponseMapper>(
        () => _i28.TokenResponseMapper());
    gh.lazySingleton<_i29.AuthInterceptor>(
        () => _i29.AuthInterceptor(gh<_i16.PreferencesRepository>()));
    gh.lazySingleton<_i30.GetBoolPreferenceUseCase>(
        () => _i30.GetBoolPreferenceUseCase(gh<_i16.PreferencesRepository>()));
    gh.lazySingleton<_i31.GetDoublePreferenceUseCase>(() =>
        _i31.GetDoublePreferenceUseCase(gh<_i16.PreferencesRepository>()));
    gh.lazySingleton<_i32.GetIntPreferenceUseCase>(
        () => _i32.GetIntPreferenceUseCase(gh<_i16.PreferencesRepository>()));
    gh.lazySingleton<_i33.GetStringPreferenceUseCase>(() =>
        _i33.GetStringPreferenceUseCase(gh<_i16.PreferencesRepository>()));
    gh.lazySingleton<_i34.GroupResponseMapper>(
        () => _i34.GroupResponseMapper(gh<_i26.SubcategoryResponseMapper>()));
    gh.factory<_i35.MediaCategoryCubit>(
        () => _i35.MediaCategoryCubit(gh<_i14.MediaRepository>()));
    gh.factory<_i36.MediaCubit>(
        () => _i36.MediaCubit(gh<_i14.MediaRepository>()));
    gh.factory<_i37.MediaListBloc>(
        () => _i37.MediaListBloc(gh<_i14.MediaRepository>()));
    gh.lazySingleton<_i38.PlacedOrderItemResponseMapper>(
        () => _i38.PlacedOrderItemResponseMapper(
              gh<_i18.ProductMiniResponseMapper>(),
              gh<_i25.SizeResponseMapper>(),
              gh<_i12.ImageResponseMapper>(),
            ));
    gh.lazySingleton<_i39.PlacedOrderResponseMapper>(() =>
        _i39.PlacedOrderResponseMapper(
            gh<_i38.PlacedOrderItemResponseMapper>()));
    gh.lazySingleton<_i40.ProductResponseMapper>(
        () => _i40.ProductResponseMapper(
              gh<_i12.ImageResponseMapper>(),
              gh<_i25.SizeResponseMapper>(),
            ));
    gh.lazySingleton<_i41.ProfileRepository>(() => _i42.ProfileRepositoryImpl(
          gh<_i10.ExceptionHandler>(),
          gh<_i8.CommonNetwork>(),
          gh<_i28.TokenResponseMapper>(),
          gh<_i4.AuthNetwork>(),
          gh<_i21.ProfileResponseMapper>(),
          gh<_i16.PreferencesRepository>(),
        ));
    gh.lazySingleton<_i43.ShippingOptionPaginationResponseMapper>(() =>
        _i43.ShippingOptionPaginationResponseMapper(
            gh<_i24.ShippingOptionResponseMapper>()));
    gh.factory<_i44.StartBloc>(() => _i44.StartBloc(
          gh<_i30.GetBoolPreferenceUseCase>(),
          gh<_i33.GetStringPreferenceUseCase>(),
          gh<_i22.SetPreferenceUseCase>(),
        ));
    gh.lazySingleton<_i45.AuthUseCase>(
        () => _i45.AuthUseCase(gh<_i41.ProfileRepository>()));
    gh.lazySingleton<_i46.CategoryResponseMapper>(
        () => _i46.CategoryResponseMapper(gh<_i34.GroupResponseMapper>()));
    gh.lazySingleton<_i47.EditProfileUseCase>(
        () => _i47.EditProfileUseCase(gh<_i41.ProfileRepository>()));
    gh.lazySingleton<_i48.FetchProfileUseCase>(
        () => _i48.FetchProfileUseCase(gh<_i41.ProfileRepository>()));
    gh.lazySingleton<_i49.OrderRepository>(() => _i50.OrderRepositoryImpl(
          gh<_i10.ExceptionHandler>(),
          gh<_i4.AuthNetwork>(),
          gh<_i39.PlacedOrderResponseMapper>(),
          gh<_i8.CommonNetwork>(),
          gh<_i43.ShippingOptionPaginationResponseMapper>(),
        ));
    gh.lazySingleton<_i51.ProductRepository>(() => _i52.ProductRepositoryImpl(
          gh<_i10.ExceptionHandler>(),
          gh<_i8.CommonNetwork>(),
          gh<_i4.AuthNetwork>(),
          gh<_i46.CategoryResponseMapper>(),
          gh<_i5.BannerResponseMapper>(),
          gh<_i27.TagResponseMapper>(),
          gh<_i19.ProductPaginationResponseMapper>(),
          gh<_i40.ProductResponseMapper>(),
          gh<_i25.SizeResponseMapper>(),
          gh<_i6.Box<Map<dynamic, dynamic>>>(),
        ));
    gh.factory<_i53.ProfileBloc>(() => _i53.ProfileBloc(
          gh<_i33.GetStringPreferenceUseCase>(),
          gh<_i48.FetchProfileUseCase>(),
          gh<_i22.SetPreferenceUseCase>(),
          gh<_i41.ProfileRepository>(),
        ));
    gh.lazySingleton<_i54.SearchProductsUseCase>(
        () => _i54.SearchProductsUseCase(gh<_i51.ProductRepository>()));
    gh.lazySingleton<_i55.ShareProductUseCase>(
        () => _i55.ShareProductUseCase(gh<_i51.ProductRepository>()));
    gh.factory<_i56.AuthBloc>(() => _i56.AuthBloc(gh<_i45.AuthUseCase>()));
    gh.lazySingleton<_i57.CreateOrderUseCase>(
        () => _i57.CreateOrderUseCase(gh<_i49.OrderRepository>()));
    gh.factory<_i58.EditProfileBloc>(
        () => _i58.EditProfileBloc(gh<_i47.EditProfileUseCase>()));
    gh.lazySingleton<_i59.FetchCategoriesUseCase>(
        () => _i59.FetchCategoriesUseCase(gh<_i51.ProductRepository>()));
    gh.lazySingleton<_i60.FetchFavoriteProductsUseCase>(
        () => _i60.FetchFavoriteProductsUseCase(gh<_i51.ProductRepository>()));
    gh.lazySingleton<_i61.FetchHomeUseCase>(
        () => _i61.FetchHomeUseCase(gh<_i51.ProductRepository>()));
    gh.lazySingleton<_i62.FetchHotProducts>(
        () => _i62.FetchHotProducts(gh<_i51.ProductRepository>()));
    gh.lazySingleton<_i63.FetchPlacedOrdersUseCase>(
        () => _i63.FetchPlacedOrdersUseCase(gh<_i49.OrderRepository>()));
    gh.lazySingleton<_i64.FetchProductUseCase>(
        () => _i64.FetchProductUseCase(gh<_i51.ProductRepository>()));
    gh.lazySingleton<_i65.FetchProductsUseCase>(
        () => _i65.FetchProductsUseCase(gh<_i51.ProductRepository>()));
    gh.lazySingleton<_i66.FetchShippingOptions>(
        () => _i66.FetchShippingOptions(gh<_i49.OrderRepository>()));
    gh.lazySingleton<_i67.FetchSubcategorySizesUseCase>(
        () => _i67.FetchSubcategorySizesUseCase(gh<_i51.ProductRepository>()));
    gh.factory<_i68.FilterBloc>(
        () => _i68.FilterBloc(gh<_i67.FetchSubcategorySizesUseCase>()));
    gh.lazySingleton<_i69.GetPlacedOrderUseCase>(
        () => _i69.GetPlacedOrderUseCase(gh<_i49.OrderRepository>()));
    gh.factory<_i70.HomeBloc>(() => _i70.HomeBloc(gh<_i61.FetchHomeUseCase>()));
    gh.factory<_i71.HotBloc>(() => _i71.HotBloc(gh<_i62.FetchHotProducts>()));
    gh.lazySingleton<_i72.LikeProductUseCase>(
        () => _i72.LikeProductUseCase(gh<_i51.ProductRepository>()));
    gh.factory<_i73.PlacedOrderBloc>(
        () => _i73.PlacedOrderBloc(gh<_i69.GetPlacedOrderUseCase>()));
    gh.factory<_i74.PlacedOrdersBloc>(
        () => _i74.PlacedOrdersBloc(gh<_i63.FetchPlacedOrdersUseCase>()));
    gh.factory<_i75.ProductsBloc>(
        () => _i75.ProductsBloc(gh<_i65.FetchProductsUseCase>()));
    gh.factory<_i76.SearchBloc>(
        () => _i76.SearchBloc(gh<_i54.SearchProductsUseCase>()));
    gh.factory<_i77.ShippingOptionsBloc>(
        () => _i77.ShippingOptionsBloc(gh<_i66.FetchShippingOptions>()));
    gh.factory<_i78.CartBloc>(
        () => _i78.CartBloc(gh<_i57.CreateOrderUseCase>()));
    gh.factory<_i79.CategoryBloc>(
        () => _i79.CategoryBloc(gh<_i59.FetchCategoriesUseCase>()));
    gh.factory<_i80.DetailBloc>(() => _i80.DetailBloc(
          gh<_i64.FetchProductUseCase>(),
          gh<_i72.LikeProductUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i81.RegisterModule {}
