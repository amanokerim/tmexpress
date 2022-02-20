import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'response_models/banner_response.dart';
import 'response_models/category_response.dart';
import 'response_models/pagination_response.dart';
import 'response_models/product_mini_response.dart';
import 'response_models/product_response.dart';
import 'response_models/tag_response.dart';
import 'response_models/token_response.dart';

part 'common_network.g.dart';

@RestApi(baseUrl: '')
abstract class CommonNetwork {
  factory CommonNetwork(Dio dio, {String baseUrl}) = _CommonNetwork;

  @GET('api/products/categoryList/')
  Future<List<CategoryResponse>> fetchCategories();

  @GET('api/products/bannerList/')
  Future<List<BannerResponse>> fetchBanners();

  @GET('api/products/tagsList/')
  Future<List<TagResponse>> fetchTags();

  @GET('api/products/subCategoryProducts/{id}/')
  Future<PaginationResponse<ProductMiniResponse>> fetchSubcategoryProducts(
    @Path('id') int id,
    @Query('offset') String? offset,
    @Query('limit') int limit,
  );

  @GET('api/products/tagProudcts/{id}/')
  Future<PaginationResponse<ProductMiniResponse>> fetchTagProducts(
    @Path('id') int id,
    @Query('offset') String? offset,
    @Query('limit') int limit,
  );

  @GET('api/products/productsOrderByHotList/')
  Future<PaginationResponse<ProductMiniResponse>> fetchHotProducts(
    @Query('offset') String? offset,
    @Query('limit') int limit,
  );

  @GET('api/products/singleProduct/{id}/')
  Future<ProductResponse> fetchProduct(
    @Path('id') int id,
  );

  @POST('api/auth/login/')
  Future<TokenResponse> auth(
    @Field('username') String phone,
    @Field('password') int code,
  );
}
