import '../../app/generated/l10n.dart';
import '../../domain/entities/order/order_status.dart';

final Map<String?, OrderStatus> orderStatuses = {
  'SARGYT EDILDI': OrderStatus(S.current.orderPlaced, 'orderplaced.png'),
  'KABUL EDILDI': OrderStatus(S.current.accepted, 'accepted.png'),
  'ÝÜZ ÖWRÜLDI': OrderStatus(S.current.declined, 'declined.png'),
  'IBERMÄGE TAÝÝAR': OrderStatus(S.current.readyToShip, 'readytoship.png'),
  'UGRADYLDY': OrderStatus(S.current.shipping, 'shipping.png'),
  'GOWŞURYLMAGA TAÝÝAR':
      OrderStatus(S.current.readyToDeliver, 'readytodeliver.png'),
  'GOWŞURYLDY': OrderStatus(S.current.delivered, 'delivered.png'),
  'YZYNA GAÝTARYLDY': OrderStatus(S.current.returned, 'returned.png'),
};
