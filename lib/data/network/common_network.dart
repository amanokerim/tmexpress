import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'response_models/banner_response.dart';
import 'response_models/category_response.dart';
import 'response_models/tag_response.dart';

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
}
