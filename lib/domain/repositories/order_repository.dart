import 'package:dartz/dartz.dart' hide Order;
import '../entities/order.dart';
import '../entities/placed_order.dart';
import '../errors/failures.dart';

abstract class OrderRepository {
  Future<Either<Failure, bool>> createOrder(Order order);

  Future<Either<Failure, List<PlacedOrder>>> fetchPlacedOrders();

  Future<Either<Failure, PlacedOrder>> getPlacedOrder(int id);
}
