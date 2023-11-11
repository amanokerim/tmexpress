import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/cart_item.dart';
import '../../../../domain/entities/product/product.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/app_flash.dart';
import '../../../widgets/app_button.dart';
import '../../cart/bloc/cart_bloc.dart';
import '../bloc/detail_bloc.dart';
import 'color.w.dart';
import 'price.w.dart';

late Product _product;

class ProductWidgets {
  ProductWidgets(this.state) {
    _product = state.product;
  }
  final DetailLoadSuccess state;

  Widget addToCardButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
      child: AppButton(
        label: S.current.addToCart,
        onPressed: () {
          final multiColor = state.product.productImages.length > 1;
          final multiSize = state.product.size.length > 1;
          if (state.selectedColor == null && multiColor) {
            AppFlash.toast(
                context: context,
                message: S.current.selectColor,
                isError: true);
          } else if (state.selectedSize == null && multiSize) {
            AppFlash.toast(
                context: context, message: S.current.selectSize, isError: true);
          } else if ((state.selectedColor != null || !multiColor) &&
              state.selectedSize != null) {
            final cartItem = CartItem(
              product: _product,
              count: 1,
              size: state.selectedSize ?? state.product.size[0],
              color: state.selectedColor ?? state.product.productImages[0],
              price: _product.normalPriceByCount(1),
              expressPrice: _product.expressPriceByCount(1),
            );
            context.read<CartBloc>().add(CartItemAdded(cartItem));
            AppFlash.toast(
                context: context,
                message: S.current.addedToCart,
                isError: true);
          }
        },
        iconFile: 'basket.png',
        type: ButtonType.black,
      ),
    );
  }

  Widget get title => Row(
        children: [
          Expanded(
            child: Text(
              state.product.title,
              style: AppTextStyle.bold20,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Image.asset('assets/icons/favorite.png',
              color: Colors.amber, width: 22),
          const SizedBox(width: 4),
          Text(
            state.product.ourRating.toStringAsFixed(1),
            style: AppTextStyle.bold16,
          ),
        ],
      );

  // Widget share(BuildContext context) => Row(
  //       children: [
  //         Expanded(
  //           child: AppButton(
  //             label: S.current.share,
  //             type: ButtonType.outline,
  //             iconFile: 'share.png',
  //             isLoading: state.detailLoad == DetailLoad.share,
  //             onPressed: () =>
  //                 context.read<DetailBloc>().add(DetailProductShared()),
  //           ),
  //         ),
  //         const SizedBox(width: 12),
  //         AppButton(
  //           label: null,
  //           type: ButtonType.outline,
  //           iconFile: 'idea.png',
  //           onPressed: () => showDialog<void>(
  //             context: context,
  //             builder: (_) => AppDialog(
  //               title: S.current.share,
  //               content: S.current.shareInformation(kReferralProductPercent),
  //               positiveButtonLabel: S.current.ok,
  //               showNegativeButton: false,
  //             ),
  //           ),
  //         ),
  //       ],
  //     );

  Widget like(BuildContext context) => AppButton(
      label: state.product.isLiked
          ? S.current.removeFromFavorites
          : S.current.addToFavorites,
      type: state.product.isLiked ? ButtonType.red : ButtonType.outline,
      iconFile: 'like.png',
      onPressed: () =>
          context.read<DetailBloc>().add(DetailProductLikeToggled()));

  List<Widget> weight() => [
        Row(
          children: [
            Text('${S.current.productWeight}:', style: AppTextStyle.bold16),
            const Spacer(),
            Text('${_product.weight} kg.', style: AppTextStyle.black16),
          ],
        ),
        const SizedBox(height: 12),
      ];

  List<Widget> description() => [
        Text('${S.current.description}:', style: AppTextStyle.bold16),
        const SizedBox(height: 8),
        Text(_product.description, style: AppTextStyle.grey16),
        const SizedBox(height: 20),
      ];

  List<Widget> prices() => [
        Text('${S.current.productPrice}:', style: AppTextStyle.bold16),
        const SizedBox(height: 8),
        Row(
          children: [
            PriceW('${S.current.retailPrice}:', _product.normalPrice).exp,
            PriceW(
              '${S.current.productPriceWholesale} '
              '(${S.current.productWholesaleDesc(_product.wholesaleLimit)}):',
              _product.expressPrice,
            ).exp,
          ],
        ),
        const SizedBox(height: 20),
      ];

  List<Widget> images() {
    final productImages = state.product.productImages;
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 2),
        child: Text(S.current.productColors, style: AppTextStyle.bold16),
      ),
      SizedBox(
        height: 64 + 12,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20 - 6),
          physics: const BouncingScrollPhysics(),
          itemCount: productImages.length,
          itemBuilder: (context, index) => ColorW(
            productImages[index],
            isSelected: state.selectedColor == productImages[index],
          ),
          scrollDirection: Axis.horizontal,
        ),
      ),
    ];
  }
}
