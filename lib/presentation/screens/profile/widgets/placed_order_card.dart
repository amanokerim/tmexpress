import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/placed_order.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/date_extension.dart';
import '../../detail/widgets/price.w.dart';
import '../placed_order/placed_order_page.dart';

class PlacedOrderCard extends StatelessWidget {
  const PlacedOrderCard(this.order, {this.clickable = true, Key? key})
      : super(key: key);
  final PlacedOrder order;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: clickable
          ? () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => PlacedOrderPage(order)))
          : null,
      tileColor: AppColors.bg2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      leading: Image.asset(
        'assets/icons/order_statuses/${order.status.icon}',
        height: 32,
      ),
      trailing: PriceW(S.current.total, order.totalPrice),
      title: Text(order.status.title, style: AppTextStyle.bold16),
      subtitle: Text(order.createdAt.dmYHm, style: AppTextStyle.grey14),
    );
  }
}
