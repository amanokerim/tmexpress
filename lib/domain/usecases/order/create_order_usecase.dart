import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart';

import '../../entities/order/order.dart';
import '../../errors/app_error.dart';
import '../../repositories/order_repository.dart';
import '../usecase.dart';

@lazySingleton
class CreateOrderUseCase extends UseCase<bool, Order> {
  CreateOrderUseCase(this._orderRepository);
  final OrderRepository _orderRepository;

  @override
  Future<Either<AppError, bool>> call(Order order) =>
      _orderRepository.createOrder(order);
}
