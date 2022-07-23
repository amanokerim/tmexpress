import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/order/placed_order.dart';
import '../../errors/app_error.dart';
import '../../repositories/order_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchPlacedOrdersUseCase extends UseCaseWithoutParams<List<PlacedOrder>> {
  FetchPlacedOrdersUseCase(this._orderRepository);
  final OrderRepository _orderRepository;

  @override
  Future<Either<AppError, List<PlacedOrder>>> call() =>
      _orderRepository.fetchPlacedOrders();
}
