import 'package:dartz/dartz.dart' hide Order;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/order/order.dart';
import '../../domain/entities/order/placed_order.dart';
import '../../domain/errors/app_error.dart';
import '../../domain/repositories/order_repository.dart';
import '../../presentation/utils/constants.dart';
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
  Future<Either<AppError, bool>> createOrder(Order order) {
    return _exception.handle(() async {
      final box = Hive.box<dynamic>(kDataBox);
      String? referralUser;
      final referredDateStr = box.get(kProductReferralDate);
      DateTime? referredDate;
      if (referredDateStr != null) {
        referredDate = DateTime.parse(referredDateStr);
        if (referredDate.add(const Duration(days: 1)).isAfter(DateTime.now())) {
          referralUser = box.get(kProductReferralUserId);
        }
      }
      await _authNetwork.createOrder(order, referralUser);
      if (referredDateStr != null) {
        await box.delete(kProductReferralDate);
        await box.delete(kProductReferralUserId);
      }
      return true;
    });
  }

  @override
  Future<Either<AppError, List<PlacedOrder>>> fetchPlacedOrders() {
    return _exception.handle(
      () => _authNetwork
          .fetchPlacedOrders()
          .then(_placedOrderResponseMapper.mapList),
    );
  }

  @override
  Future<Either<AppError, PlacedOrder>> getPlacedOrder(int id) {
    return _exception.handle(
      () =>
          _authNetwork.getPlacedOrder(id).then(_placedOrderResponseMapper.map),
    );
  }
}
