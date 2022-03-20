import '../../app/generated/l10n.dart';
import '../../domain/entities/interface/order_status.dart';

final Map<String?, OrderStatus> orderStatuses = {
  'ORDERPLACED': OrderStatus(S.current.orderPlaced, 'orderplaced.png'),
  'ACCEPTED': OrderStatus(S.current.accepted, 'accepted.png'),
  'DECLINED': OrderStatus(S.current.declined, 'declined.png'),
  'READYTOSHIP': OrderStatus(S.current.readyToShip, 'readytoship.png'),
  'SHIPPING': OrderStatus(S.current.shipping, 'shipping.png'),
  'READYTODELIVER': OrderStatus(S.current.readyToDeliver, 'readytodeliver.png'),
  'DELIVERING': OrderStatus(S.current.delivering, 'delivering.png'),
  'DELIVERED': OrderStatus(S.current.delivered, 'delivered.png'),
  'RETURNED': OrderStatus(S.current.returned, 'returned.png'),
};
