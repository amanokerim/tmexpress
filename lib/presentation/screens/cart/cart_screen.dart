import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/generated/l10n.dart';
import '../../utils/app_flash.dart';
import '../../widgets/app_confirm_dialog.dart';
import '../../widgets/app_empty.dart';
import '../profile/bloc/profile_bloc.dart';
import '../start/bloc/start_bloc.dart';
import 'bloc/cart_bloc.dart';
import 'widgets/cart_item_card.dart';
import 'widgets/continue_order_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (_, state) async {
        if (state.error != null) {
          if (!state.error!.isAuth) {
            context.read<StartBloc>().add(const StartNavigatedToHome(tab: 4));
            context.read<ProfileBloc>().add(ProfileStarted());
            Navigator.of(context).pop();
          }
          await AppFlash.bigToast(
              context: context, message: state.error!.message);
        }
        if (state.st == CartSt.done) {
          Navigator.of(context).pop();
          await showDialog<void>(
            context: context,
            builder: (_) => AppDialog(
              content: S.current.orderCreated,
              positiveButtonLabel: S.current.ok,
              showNegativeButton: false,
            ),
          );
          context.read<CartBloc>().add(CartCleared());
        }
      },
      builder: (_, state) => state.items.isEmpty
          ? AppEmpty(message: S.current.cartEmpty)
          : Column(
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
                if (state.items.isNotEmpty)
                  ContinueOrderButton(
                    total: state.total,
                    selectedShippingOption: state.shippingOption,
                  ),
              ],
            ),
    );
  }
}
