import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'response_models/category_response.dart';

part 'common_network.g.dart';

@RestApi(baseUrl: '')
abstract class CommonNetwork {
  factory CommonNetwork(Dio dio, {String baseUrl}) = _CommonNetwork;

  @GET('api/products/categoryList/')
  Future<List<CategoryResponse>> fetchCategories();
}
