import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart';

import '../../domain/entities/order.dart';
import '../../domain/entities/placed_order.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/order_repository.dart';
import '../error/exception_handler.dart';
import '../mappers/response_mappers/placed_order_response_mapper.dart';
import '../network/auth_network.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl(
      this._exception, this._authNetwork, this._placedOrderResponseMapper);

  final ExceptionHandler _exception;
  final AuthNetwork _authNetwork;
  final PlacedOrderResponseMapper _placedOrderResponseMapper;

  @override
  Future<Either<Failure, bool>> createOrder(Order order) {
    return _exception.handle(() async {
      await _authNetwork.createOrder(order);
      return true;
    });
  }

  @override
  Future<Either<Failure, List<PlacedOrder>>> fetchPlacedOrders() {
    return _exception.handle(
      () => _authNetwork
          .fetchPlacedOrders()
          .then(_placedOrderResponseMapper.mapList),
    );
  }

  @override
  Future<Either<Failure, PlacedOrder>> getPlacedOrder(int id) {
    return _exception.handle(
      () =>
          _authNetwork.getPlacedOrder(id).then(_placedOrderResponseMapper.map),
    );
  }
}
