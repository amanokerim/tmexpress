import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart';

import '../../entities/order.dart';
import '../../errors/failures.dart';
import '../../repositories/order_repository.dart';
import '../usecase.dart';

@lazySingleton
class CreateOrderUseCase extends UseCase<bool, Order> {
  CreateOrderUseCase(this._orderRepository);
  final OrderRepository _orderRepository;

  @override
  Future<Either<Failure, bool>> call(Order order) {
    return _orderRepository.createOrder(order);
  }
}
