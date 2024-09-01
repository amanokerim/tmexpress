// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i22;

import '../../data/error/error_mapper.dart' as _i8;
import '../../data/error/exception_handler.dart' as _i9;
import '../../data/local/hive_boxes.dart' as _i10;
import '../../data/mappers/response_mappers/banner_response_mapper.dart' as _i4;
import '../../data/mappers/response_mappers/category_response_mapper.dart'
    as _i45;
import '../../data/mappers/response_mappers/group_response_mapper.dart' as _i33;
import '../../data/mappers/response_mappers/image_response_mapper.dart' as _i11;
import '../../data/mappers/response_mappers/media_pagination_response_mapper.dart'
    as _i19;
import '../../data/mappers/response_mappers/placed_order_item_response_mapper.dart'
    as _i37;
import '../../data/mappers/response_mappers/placed_order_response_mapper.dart'
    as _i38;
import '../../data/mappers/response_mappers/product_mini_response_mapper.dart'
    as _i17;
import '../../data/mappers/response_mappers/product_pagination_response_mapper.dart'
    as _i18;
import '../../data/mappers/response_mappers/product_response_mapper.dart'
    as _i39;
import '../../data/mappers/response_mappers/profile_response_mapper.dart'
    as _i20;
import '../../data/mappers/response_mappers/shipping_option_pagination_response_mapper.dart'
    as _i42;
import '../../data/mappers/response_mappers/shipping_option_response_mapper.dart'
    as _i23;
import '../../data/mappers/response_mappers/size_response_mapper.dart' as _i24;
import '../../data/mappers/response_mappers/subcategory_response_mapper.dart'
    as _i25;
import '../../data/mappers/response_mappers/tag_response_mapper.dart' as _i26;
import '../../data/mappers/response_mappers/token_response_mapper.dart' as _i27;
import '../../data/network/auth_interceptor.dart' as _i28;
import '../../data/network/auth_network.dart' as _i3;
import '../../data/network/common_network.dart' as _i7;
import '../../data/repositories/media_repository_impl.dart' as _i14;
import '../../data/repositories/order_respository_impl.dart' as _i49;
import '../../data/repositories/preferences_repository_impl.dart' as _i16;
import '../../data/repositories/product_repository_impl.dart' as _i51;
import '../../data/repositories/profile_repository_impl.dart' as _i41;
import '../../domain/repositories/media_repository.dart' as _i13;
import '../../domain/repositories/order_repository.dart' as _i48;
import '../../domain/repositories/preferences_repository.dart' as _i15;
import '../../domain/repositories/product_repository.dart' as _i50;
import '../../domain/repositories/profile_repository.dart' as _i40;
import '../../domain/usecases/order/create_order_usecase.dart' as _i56;
import '../../domain/usecases/order/fetch_orders_usecase.dart' as _i62;
import '../../domain/usecases/order/fetch_shipping_options.dart' as _i65;
import '../../domain/usecases/order/get_placed_order.dart' as _i68;
import '../../domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i29;
import '../../domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i30;
import '../../domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i31;
import '../../domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i32;
import '../../domain/usecases/preferences/set_preference_usecase.dart' as _i21;
import '../../domain/usecases/products/fetch_categories_usecase.dart' as _i58;
import '../../domain/usecases/products/fetch_favorite_products_usecase.dart'
    as _i59;
import '../../domain/usecases/products/fetch_home_usecase.dart' as _i60;
import '../../domain/usecases/products/fetch_hot_products.dart' as _i61;
import '../../domain/usecases/products/fetch_product_usecase.dart' as _i63;
import '../../domain/usecases/products/fetch_products_usecase.dart' as _i64;
import '../../domain/usecases/products/fetch_subcategory_sizes.dart' as _i66;
import '../../domain/usecases/products/like_product_usecase.dart' as _i71;
import '../../domain/usecases/products/search_product_usecase.dart' as _i53;
import '../../domain/usecases/products/share_product_usecase.dart' as _i54;
import '../../domain/usecases/profile/auth_usecase.dart' as _i44;
import '../../domain/usecases/profile/edit_profile_usecase.dart' as _i46;
import '../../domain/usecases/profile/fetch_profile_usecase.dart' as _i47;
import '../../presentation/screens/auth/bloc/auth_bloc.dart' as _i55;
import '../../presentation/screens/cart/bloc/cart_bloc.dart' as _i77;
import '../../presentation/screens/category/bloc/category_bloc.dart' as _i78;
import '../../presentation/screens/detail/bloc/detail_bloc.dart' as _i79;
import '../../presentation/screens/home/bloc/home_bloc.dart' as _i69;
import '../../presentation/screens/home/search/bloc/search_bloc.dart' as _i75;
import '../../presentation/screens/hot/bloc/hot_bloc.dart' as _i70;
import '../../presentation/screens/main/bloc/main_bloc.dart' as _i12;
import '../../presentation/screens/media/bloc/media_list_bloc.dart' as _i36;
import '../../presentation/screens/media/cubit/media_category_cubit.dart'
    as _i34;
import '../../presentation/screens/media/media_detail/cubit/media_cubit.dart'
    as _i35;
import '../../presentation/screens/products/bloc/filter/filter_bloc.dart'
    as _i67;
import '../../presentation/screens/products/bloc/products_bloc.dart' as _i74;
import '../../presentation/screens/profile/bloc/profile_bloc.dart' as _i52;
import '../../presentation/screens/profile/edit_profile/bloc/edit_profile_bloc.dart'
    as _i57;
import '../../presentation/screens/profile/placed_order/bloc/placed_order_bloc.dart'
    as _i72;
import '../../presentation/screens/profile/placed_orders/bloc/placed_orders_bloc.dart'
    as _i73;
import '../../presentation/screens/shipping_options/bloc/shipping_options_bloc.dart'
    as _i76;
import '../../presentation/screens/start/bloc/start_bloc.dart' as _i43;
import 'register_module.dart' as _i80;

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
    gh.lazySingleton<_i3.AuthNetwork>(() => registerModule.authNetwork);
    gh.lazySingleton<_i4.BannerResponseMapper>(
        () => _i4.BannerResponseMapper());
    gh.lazySingleton<_i5.Box<Map<dynamic, dynamic>>>(
        () => registerModule.favoritesBox);
    gh.lazySingleton<_i6.CacheOptions>(() => registerModule.cacheOption);
    gh.lazySingleton<_i7.CommonNetwork>(() => registerModule.commonNetwork);
    gh.lazySingleton<_i8.ErrorMapper>(() => _i8.ErrorMapper());
    gh.lazySingleton<_i9.ExceptionHandler>(
        () => _i9.ExceptionHandler(gh<_i8.ErrorMapper>()));
    gh.lazySingleton<_i10.HiveBoxes>(() => _i10.HiveBoxes());
    gh.lazySingleton<_i11.ImageResponseMapper>(
        () => _i11.ImageResponseMapper());
    gh.factory<_i12.MainBloc>(() => _i12.MainBloc());
    gh.lazySingleton<_i13.MediaRepository>(() => _i14.MediaRepositoryImpl(
          gh<_i9.ExceptionHandler>(),
          gh<_i7.CommonNetwork>(),
          gh<_i5.Box<Map<dynamic, dynamic>>>(),
        ));
    gh.lazySingleton<_i15.PreferencesRepository>(
        () => _i16.PreferencesRepositoryImpl());
    gh.lazySingleton<_i17.ProductMiniResponseMapper>(
        () => _i17.ProductMiniResponseMapper());
    gh.lazySingleton<_i18.ProductPaginationResponseMapper>(() =>
        _i18.ProductPaginationResponseMapper(
            gh<_i17.ProductMiniResponseMapper>()));
    gh.lazySingleton<_i19.ProductPaginationResponseMapper>(() =>
        _i19.ProductPaginationResponseMapper(
            gh<_i17.ProductMiniResponseMapper>()));
    gh.lazySingleton<_i20.ProfileResponseMapper>(
        () => _i20.ProfileResponseMapper());
    gh.lazySingleton<_i21.SetPreferenceUseCase>(
        () => _i21.SetPreferenceUseCase(gh<_i15.PreferencesRepository>()));
    await gh.lazySingletonAsync<_i22.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i23.ShippingOptionResponseMapper>(
        () => _i23.ShippingOptionResponseMapper());
    gh.lazySingleton<_i24.SizeResponseMapper>(() => _i24.SizeResponseMapper());
    gh.lazySingleton<_i25.SubcategoryResponseMapper>(
        () => _i25.SubcategoryResponseMapper());
    gh.lazySingleton<_i26.TagResponseMapper>(
        () => _i26.TagResponseMapper(gh<_i17.ProductMiniResponseMapper>()));
    gh.lazySingleton<_i27.TokenResponseMapper>(
        () => _i27.TokenResponseMapper());
    gh.lazySingleton<_i28.AuthInterceptor>(
        () => _i28.AuthInterceptor(gh<_i15.PreferencesRepository>()));
    gh.lazySingleton<_i29.GetBoolPreferenceUseCase>(
        () => _i29.GetBoolPreferenceUseCase(gh<_i15.PreferencesRepository>()));
    gh.lazySingleton<_i30.GetDoublePreferenceUseCase>(() =>
        _i30.GetDoublePreferenceUseCase(gh<_i15.PreferencesRepository>()));
    gh.lazySingleton<_i31.GetIntPreferenceUseCase>(
        () => _i31.GetIntPreferenceUseCase(gh<_i15.PreferencesRepository>()));
    gh.lazySingleton<_i32.GetStringPreferenceUseCase>(() =>
        _i32.GetStringPreferenceUseCase(gh<_i15.PreferencesRepository>()));
    gh.lazySingleton<_i33.GroupResponseMapper>(
        () => _i33.GroupResponseMapper(gh<_i25.SubcategoryResponseMapper>()));
    gh.factory<_i34.MediaCategoryCubit>(
        () => _i34.MediaCategoryCubit(gh<_i13.MediaRepository>()));
    gh.factory<_i35.MediaCubit>(
        () => _i35.MediaCubit(gh<_i13.MediaRepository>()));
    gh.factory<_i36.MediaListBloc>(
        () => _i36.MediaListBloc(gh<_i13.MediaRepository>()));
    gh.lazySingleton<_i37.PlacedOrderItemResponseMapper>(
        () => _i37.PlacedOrderItemResponseMapper(
              gh<_i17.ProductMiniResponseMapper>(),
              gh<_i24.SizeResponseMapper>(),
              gh<_i11.ImageResponseMapper>(),
            ));
    gh.lazySingleton<_i38.PlacedOrderResponseMapper>(() =>
        _i38.PlacedOrderResponseMapper(
            gh<_i37.PlacedOrderItemResponseMapper>()));
    gh.lazySingleton<_i39.ProductResponseMapper>(
        () => _i39.ProductResponseMapper(
              gh<_i11.ImageResponseMapper>(),
              gh<_i24.SizeResponseMapper>(),
            ));
    gh.lazySingleton<_i40.ProfileRepository>(() => _i41.ProfileRepositoryImpl(
          gh<_i9.ExceptionHandler>(),
          gh<_i7.CommonNetwork>(),
          gh<_i27.TokenResponseMapper>(),
          gh<_i3.AuthNetwork>(),
          gh<_i20.ProfileResponseMapper>(),
          gh<_i15.PreferencesRepository>(),
        ));
    gh.lazySingleton<_i42.ShippingOptionPaginationResponseMapper>(() =>
        _i42.ShippingOptionPaginationResponseMapper(
            gh<_i23.ShippingOptionResponseMapper>()));
    gh.factory<_i43.StartBloc>(() => _i43.StartBloc(
          gh<_i29.GetBoolPreferenceUseCase>(),
          gh<_i32.GetStringPreferenceUseCase>(),
          gh<_i21.SetPreferenceUseCase>(),
        ));
    gh.lazySingleton<_i44.AuthUseCase>(
        () => _i44.AuthUseCase(gh<_i40.ProfileRepository>()));
    gh.lazySingleton<_i45.CategoryResponseMapper>(
        () => _i45.CategoryResponseMapper(gh<_i33.GroupResponseMapper>()));
    gh.lazySingleton<_i46.EditProfileUseCase>(
        () => _i46.EditProfileUseCase(gh<_i40.ProfileRepository>()));
    gh.lazySingleton<_i47.FetchProfileUseCase>(
        () => _i47.FetchProfileUseCase(gh<_i40.ProfileRepository>()));
    gh.lazySingleton<_i48.OrderRepository>(() => _i49.OrderRepositoryImpl(
          gh<_i9.ExceptionHandler>(),
          gh<_i3.AuthNetwork>(),
          gh<_i38.PlacedOrderResponseMapper>(),
          gh<_i7.CommonNetwork>(),
          gh<_i42.ShippingOptionPaginationResponseMapper>(),
        ));
    gh.lazySingleton<_i50.ProductRepository>(() => _i51.ProductRepositoryImpl(
          gh<_i9.ExceptionHandler>(),
          gh<_i7.CommonNetwork>(),
          gh<_i3.AuthNetwork>(),
          gh<_i45.CategoryResponseMapper>(),
          gh<_i4.BannerResponseMapper>(),
          gh<_i26.TagResponseMapper>(),
          gh<_i18.ProductPaginationResponseMapper>(),
          gh<_i39.ProductResponseMapper>(),
          gh<_i24.SizeResponseMapper>(),
          gh<_i5.Box<Map<dynamic, dynamic>>>(),
        ));
    gh.factory<_i52.ProfileBloc>(() => _i52.ProfileBloc(
          gh<_i32.GetStringPreferenceUseCase>(),
          gh<_i47.FetchProfileUseCase>(),
          gh<_i21.SetPreferenceUseCase>(),
          gh<_i40.ProfileRepository>(),
        ));
    gh.lazySingleton<_i53.SearchProductsUseCase>(
        () => _i53.SearchProductsUseCase(gh<_i50.ProductRepository>()));
    gh.lazySingleton<_i54.ShareProductUseCase>(
        () => _i54.ShareProductUseCase(gh<_i50.ProductRepository>()));
    gh.factory<_i55.AuthBloc>(() => _i55.AuthBloc(gh<_i44.AuthUseCase>()));
    gh.lazySingleton<_i56.CreateOrderUseCase>(
        () => _i56.CreateOrderUseCase(gh<_i48.OrderRepository>()));
    gh.factory<_i57.EditProfileBloc>(
        () => _i57.EditProfileBloc(gh<_i46.EditProfileUseCase>()));
    gh.lazySingleton<_i58.FetchCategoriesUseCase>(
        () => _i58.FetchCategoriesUseCase(gh<_i50.ProductRepository>()));
    gh.lazySingleton<_i59.FetchFavoriteProductsUseCase>(
        () => _i59.FetchFavoriteProductsUseCase(gh<_i50.ProductRepository>()));
    gh.lazySingleton<_i60.FetchHomeUseCase>(
        () => _i60.FetchHomeUseCase(gh<_i50.ProductRepository>()));
    gh.lazySingleton<_i61.FetchHotProducts>(
        () => _i61.FetchHotProducts(gh<_i50.ProductRepository>()));
    gh.lazySingleton<_i62.FetchPlacedOrdersUseCase>(
        () => _i62.FetchPlacedOrdersUseCase(gh<_i48.OrderRepository>()));
    gh.lazySingleton<_i63.FetchProductUseCase>(
        () => _i63.FetchProductUseCase(gh<_i50.ProductRepository>()));
    gh.lazySingleton<_i64.FetchProductsUseCase>(
        () => _i64.FetchProductsUseCase(gh<_i50.ProductRepository>()));
    gh.lazySingleton<_i65.FetchShippingOptions>(
        () => _i65.FetchShippingOptions(gh<_i48.OrderRepository>()));
    gh.lazySingleton<_i66.FetchSubcategorySizesUseCase>(
        () => _i66.FetchSubcategorySizesUseCase(gh<_i50.ProductRepository>()));
    gh.factory<_i67.FilterBloc>(
        () => _i67.FilterBloc(gh<_i66.FetchSubcategorySizesUseCase>()));
    gh.lazySingleton<_i68.GetPlacedOrderUseCase>(
        () => _i68.GetPlacedOrderUseCase(gh<_i48.OrderRepository>()));
    gh.factory<_i69.HomeBloc>(() => _i69.HomeBloc(gh<_i60.FetchHomeUseCase>()));
    gh.factory<_i70.HotBloc>(
        () => _i70.HotBloc(gh<_i53.SearchProductsUseCase>()));
    gh.lazySingleton<_i71.LikeProductUseCase>(
        () => _i71.LikeProductUseCase(gh<_i50.ProductRepository>()));
    gh.factory<_i72.PlacedOrderBloc>(
        () => _i72.PlacedOrderBloc(gh<_i68.GetPlacedOrderUseCase>()));
    gh.factory<_i73.PlacedOrdersBloc>(
        () => _i73.PlacedOrdersBloc(gh<_i62.FetchPlacedOrdersUseCase>()));
    gh.factory<_i74.ProductsBloc>(
        () => _i74.ProductsBloc(gh<_i64.FetchProductsUseCase>()));
    gh.factory<_i75.SearchBloc>(
        () => _i75.SearchBloc(gh<_i53.SearchProductsUseCase>()));
    gh.factory<_i76.ShippingOptionsBloc>(
        () => _i76.ShippingOptionsBloc(gh<_i65.FetchShippingOptions>()));
    gh.factory<_i77.CartBloc>(
        () => _i77.CartBloc(gh<_i56.CreateOrderUseCase>()));
    gh.factory<_i78.CategoryBloc>(
        () => _i78.CategoryBloc(gh<_i58.FetchCategoriesUseCase>()));
    gh.factory<_i79.DetailBloc>(() => _i79.DetailBloc(
          gh<_i63.FetchProductUseCase>(),
          gh<_i71.LikeProductUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i80.RegisterModule {}
