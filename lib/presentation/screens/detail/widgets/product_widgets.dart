import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/cart_item.dart';
import '../../../../domain/entities/product.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/app_flash.dart';
import '../../../widgets/app_button.dart';
import '../../cart/bloc/cart_bloc.dart';
import '../bloc/detail_bloc.dart';
import 'price.w.dart';

late Product _product;

class ProductWidgets extends StatelessWidget {
  ProductWidgets(this.state, {Key? key}) : super(key: key) {
    _product = state.product;
  }
  final DetailLoadSuccess state;

  Widget addToCardButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
      child: AppButton(
        label: S.current.addToCart,
        onPressed: () {
          if (state.selectedColor == null) {
            AppFlash.toast(context: context, message: S.current.selectColor);
          } else if (state.selectedSize == null) {
            AppFlash.toast(context: context, message: S.current.selectSize);
          } else if (state.selectedColor != null &&
              state.selectedSize != null) {
            final cartItem = CartItem(
                product: _product,
                count: 1,
                size: state.selectedSize!,
                color: state.selectedColor!);
            context.read<CartBloc>().add(CartItemAdded(cartItem));
            AppFlash.toast(context: context, message: S.current.addedToCart);
          }
        },
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
          Text('${_product.weight} kg.', style: AppTextStyle.black16),
        ],
      ),
      const SizedBox(height: 12),
    ];
  }

  List<Widget> description() {
    return [
      Text('Beýany:', style: AppTextStyle.bold16),
      const SizedBox(height: 8),
      Text(_product.description, style: AppTextStyle.grey16),
      const SizedBox(height: 20),
    ];
  }

  List<Widget> prices() {
    return [
      Text('${S.current.productPrice}:', style: AppTextStyle.bold16),
      const SizedBox(height: 8),
      Row(
        children: [
          PriceW(S.current.productPriceNormal, _product.normalPrice),
          PriceW(S.current.productPriceExpress, _product.expressPrice),
        ],
      ),
      const SizedBox(height: 20),
      Text(
          '${S.current.productPriceWholesale} '
          '(${S.current.productWholesaleDesc(_product.wholesaleLimit)}):',
          style: AppTextStyle.bold16),
      const SizedBox(height: 8),
      Row(
        children: [
          PriceW(S.current.productPriceNormal, _product.normalPriceW),
          PriceW(S.current.productPriceExpress, _product.expressPriceW),
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
              child: Text(_product.title,
                  style: AppTextStyle.bold20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis)),
          Image.asset('assets/icons/favorite.png',
              color: Colors.amber, width: 22),
          const SizedBox(width: 4),
          Text(
            _product.ourRating.toStringAsFixed(1),
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
