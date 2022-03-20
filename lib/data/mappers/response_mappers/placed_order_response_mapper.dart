import 'package:injectable/injectable.dart';

import '../../../domain/entities/placed_order.dart';
import '../../network/response_models/placed_order_response.dart';
import '../mapper.dart';

@lazySingleton
class PlacedOrderResponseMapper
    extends Mapper<PlacedOrderResponse, PlacedOrder> {
  @override
  PlacedOrder map(PlacedOrderResponse? entity) => PlacedOrder(
        id: entity?.id ?? 0,
        user: entity?.user ?? 0,
        status: entity?.status ?? '',
        totalPrice: entity?.totalPrice ?? 0,
        createdAt: DateTime.parse(entity?.createdAt ?? ''),
        updatedAt: DateTime.parse(entity?.updatedAt ?? ''),
      );
}
