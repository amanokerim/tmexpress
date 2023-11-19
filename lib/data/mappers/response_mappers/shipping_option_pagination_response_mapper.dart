import 'package:injectable/injectable.dart';

import '../../../domain/entities/order/shipping_option.dart';
import '../../network/response_models/shipping_option_response.dart';
import '../pagination_response_mapper.dart';
import 'shipping_option_response_mapper.dart';

@lazySingleton
class ShippingOptionPaginationResponseMapper
    extends PaginationResponseMapper<ShippingOptionResponse, ShippingOption> {
  ShippingOptionPaginationResponseMapper(ShippingOptionResponseMapper mapper)
      : super(mapper);
}
