import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'response_models/profile_response.dart';

part 'auth_network.g.dart';

@RestApi(baseUrl: '')
abstract class AuthNetwork {
  factory AuthNetwork(Dio dio, {String baseUrl}) = _AuthNetwork;

  @GET('api/auth/profile/')
  Future<ProfileResponse> fetchProfile();

  @PATCH('api/products/singleProductLike/{id}/')
  Future<void> like(@Path('id') int id);

  @PATCH('api/products/singleProductShare/{id}/')
  Future<void> share(@Path('id') int id);
}
