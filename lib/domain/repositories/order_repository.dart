import 'package:dartz/dartz.dart' hide Order;
import '../entities/order.dart';
import '../errors/failures.dart';

abstract class OrderRepository {
  Future<Either<Failure, bool>> createOrder(Order order);
}
