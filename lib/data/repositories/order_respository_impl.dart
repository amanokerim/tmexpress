import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart';

import '../../domain/entities/order.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/order_repository.dart';
import '../error/exception_handler.dart';
import '../network/auth_network.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl(this._exception, this._authNetwork);

  final ExceptionHandler _exception;
  final AuthNetwork _authNetwork;

  @override
  Future<Either<Failure, bool>> createOrder(Order order) {
    return _exception.handle(() async {
      await _authNetwork.createOrder(order);
      return true;
    });
  }
}
