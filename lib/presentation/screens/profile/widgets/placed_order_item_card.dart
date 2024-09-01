import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/order/placed_order_item.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';

class PlacedOrderItemCard extends StatelessWidget {
  const PlacedOrderItemCard(this.item, {Key? key}) : super(key: key);
  final PlacedOrderItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(item.color.urlMini, height: 80, width: 80),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.product.title,
                style: AppTextStyle.bold18,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                '${item.status.title}  |  '
                '${S.current.size}: ${item.size.title}',
                style: AppTextStyle.grey14,
              ),
              const SizedBox(height: 4),
              Text('${item.qty} x ${item.price} man.',
                  style: AppTextStyle.black16),
            ],
          ),
        ),
      ],
    );
  }
}
