import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_network.g.dart';

@RestApi(baseUrl: '')
abstract class AuthNetwork {
  factory AuthNetwork(Dio dio, {String baseUrl}) = _AuthNetwork;
}
