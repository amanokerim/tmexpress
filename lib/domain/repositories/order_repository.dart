import 'package:dartz/dartz.dart' hide Order;
import '../entities/order.dart';
import '../entities/placed_order.dart';
import '../errors/app_error.dart';

abstract class OrderRepository {
  Future<Either<AppError, bool>> createOrder(Order order);

  Future<Either<AppError, List<PlacedOrder>>> fetchPlacedOrders();

  Future<Either<AppError, PlacedOrder>> getPlacedOrder(int id);
}
