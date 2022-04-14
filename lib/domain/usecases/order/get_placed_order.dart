import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/placed_order.dart';
import '../../errors/app_error.dart';
import '../../repositories/order_repository.dart';
import '../usecase.dart';

@lazySingleton
class GetPlacedOrderUseCase extends UseCase<PlacedOrder, int> {
  GetPlacedOrderUseCase(this._orderRepository);
  final OrderRepository _orderRepository;

  @override
  Future<Either<AppError, PlacedOrder>> call(int id) =>
      _orderRepository.getPlacedOrder(id);
}
