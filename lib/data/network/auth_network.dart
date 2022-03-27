import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/entities/order.dart';
import '../../domain/entities/profile.dart';
import 'response_models/placed_order_response.dart';
import 'response_models/profile_response.dart';

part 'auth_network.g.dart';

@RestApi(baseUrl: '')
abstract class AuthNetwork {
  factory AuthNetwork(Dio dio, {String baseUrl}) = _AuthNetwork;

  @GET('api/auth/profile/')
  Future<ProfileResponse> fetchProfile();

  @PATCH('api/products/singleProductLike/{id}/')
  Future<void> like(@Path('id') int id);

  @PATCH('api/products/singleProductUnLike/{id}/')
  Future<void> unLike(@Path('id') int id);

  @PATCH('api/products/singleProductShare/{id}/')
  Future<void> share(@Path('id') int id);

  @POST('api/order/order-create/')
  Future<void> createOrder(
    @Body() Order order,
    @Query('referalUser') String? referralUserId,
  );

  @GET('api/order/orderList/')
  Future<List<PlacedOrderResponse>> fetchPlacedOrders();

  @GET('api/order/order-detail/{id}/')
  Future<PlacedOrderResponse> getPlacedOrder(
    @Path() final int id,
  );

  @PUT('api/auth/profile/')
  Future<void> editProfile(
    @Body() Profile profile,
  );
}
