import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/product.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_button.dart';
import 'price.w.dart';

class ProductWidgets extends StatelessWidget {
  const ProductWidgets(this.product, {Key? key}) : super(key: key);
  final Product product;

  Widget addToCardButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
      child: AppButton(
        label: S.current.addToCart,
        onPressed: () {},
        iconFile: 'basket.png',
        type: ButtonType.black,
      ),
    );
  }

  List<Widget> weight() {
    return [
      Row(
        children: [
          Text('${S.current.productWeight}:', style: AppTextStyle.bold16),
          const Spacer(),
          Text('${product.weight} kg.', style: AppTextStyle.black16),
        ],
      ),
      const SizedBox(height: 12),
    ];
  }

  List<Widget> description() {
    return [
      Text('Beýany:', style: AppTextStyle.bold16),
      const SizedBox(height: 8),
      Text(product.description, style: AppTextStyle.grey16),
      const SizedBox(height: 20),
    ];
  }

  List<Widget> prices() {
    return [
      Text('${S.current.productPrice}:', style: AppTextStyle.bold16),
      const SizedBox(height: 8),
      Row(
        children: [
          PriceW(S.current.productPriceNormal, product.normalPrice),
          PriceW(S.current.productPriceExpress, product.expressPrice),
        ],
      ),
      const SizedBox(height: 20),
      Text(
          '${S.current.productPriceWholesale} '
          '(${S.current.productWholesaleDesc(product.wholesaleLimit)}):',
          style: AppTextStyle.bold16),
      const SizedBox(height: 8),
      Row(
        children: [
          PriceW(S.current.productPriceNormal, product.normalPriceW),
          PriceW(S.current.productPriceExpress, product.expressPriceW),
        ],
      ),
      const SizedBox(height: 20),
    ];
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
              child: Text(product.title,
                  style: AppTextStyle.bold20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis)),
          Image.asset('assets/icons/favorite.png',
              color: Colors.amber, width: 22),
          const SizedBox(width: 4),
          Text(
            product.ourRating.toStringAsFixed(1),
            style: AppTextStyle.bold16,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
