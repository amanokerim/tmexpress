import 'package:injectable/injectable.dart';

import '../../../domain/entities/order/shipping_option.dart';
import '../../network/response_models/shipping_option_response.dart';
import '../mapper.dart';

@lazySingleton
class ShippingOptionResponseMapper
    extends Mapper<ShippingOptionResponse, ShippingOption> {
  @override
  ShippingOption map(ShippingOptionResponse? entity) {
    final parts = (entity?.title ?? '').split('; ');
    return ShippingOption(
      id: entity?.id ?? 1,
      title: parts[0],
      duration: parts.length > 1 ? parts[1] : '',
      priceUnit: parts.length > 2 ? parts[2] : '',
      price: entity?.price ?? 0,
      image: '${entity?.image}',
    );
  }
}
