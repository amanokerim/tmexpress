import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/generated/l10n.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_button.dart';
import 'bloc/cart_bloc.dart';
import 'widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: state.items.length,
                itemBuilder: (_, index) => CartItemCard(state.items[index],
                    isExpress: state.isExpress),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
              ),
            ),
            SwitchListTile.adaptive(
              value: state.isExpress,
              contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              activeColor: AppColors.secondary,
              dense: true,
              onChanged: (_) =>
                  context.read<CartBloc>().add(CartDeliveryMethodChanged()),
              title: Text(
                state.isExpress ? S.current.express : S.current.normal,
                style: AppTextStyle.bold16,
              ),
              subtitle: Text(
                state.isExpress
                    ? S.current.expressSubtitle
                    : S.current.normalSubtitle,
                style: AppTextStyle.grey14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(
                          text: S.current.total,
                          style: AppTextStyle.grey14,
                          children: [
                        TextSpan(
                          text: S.current.nMan(state.total),
                          style: AppTextStyle.bold16.copyWith(height: 1.3),
                        )
                      ])),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppButton(
                      label: S.current.continueButton,
                      type: ButtonType.black,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
