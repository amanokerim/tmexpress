import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/order/shipping_option.dart';
import '../../entities/product/pagination.dart';
import '../../errors/app_error.dart';
import '../../repositories/order_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchShippingOptions
    extends UseCaseWithoutParams<PaginationM<ShippingOption>> {
  FetchShippingOptions(this._orderRepository);
  final OrderRepository _orderRepository;

  @override
  Future<Either<AppError, PaginationM<ShippingOption>>> call() =>
      _orderRepository.getShippingOptions();
}
