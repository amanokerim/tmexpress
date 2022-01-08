import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'response_models/product_response.dart';

part 'common_network.g.dart';

@RestApi(baseUrl: '')
abstract class CommonNetwork {
  factory CommonNetwork(Dio dio, {String baseUrl}) = _CommonNetwork;

  @GET('https://fakestoreapi.com/products')
  Future<List<ProductResponse>> fetchProducts();
}
