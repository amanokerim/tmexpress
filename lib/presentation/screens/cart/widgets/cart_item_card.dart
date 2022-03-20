import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/cart_item.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';
import 'cart_item_count.w.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard(this.cartItem, {required this.isExpress, Key? key})
      : super(key: key);
  final CartItem cartItem;
  final bool isExpress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            AppImage(cartItem.color.urlMini, height: 80, width: 80),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.title,
                    style: AppTextStyle.bold18,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text('${S.current.size}: ${cartItem.size.title}',
                      style: AppTextStyle.grey14),
                  const SizedBox(height: 4),
                  Text('${cartItem.price} man.', style: AppTextStyle.black16),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          bottom: -10,
          child: CartItemCountW(cartItem),
        ),
      ],
    );
  }
}
