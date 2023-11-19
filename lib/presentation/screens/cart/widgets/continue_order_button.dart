import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/order/shipping_option.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/app_flash.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_error.dart';
import '../../../widgets/app_progress_indicator.dart';
import '../../main/bloc/main_bloc.dart';
import '../../profile/bloc/profile_bloc.dart';
import '../../profile/widgets/profile_card.dart';
import '../bloc/cart_bloc.dart';
import 'shipping_options_selector.dart';

class ContinueOrderButton extends StatelessWidget {
  const ContinueOrderButton({
    required this.total,
    required this.selectedShippingOption,
    Key? key,
  }) : super(key: key);
  final double total;
  final ShippingOption? selectedShippingOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: '${S.current.total}:\n',
              style: AppTextStyle.grey14,
              children: [
                TextSpan(
                  text: S.current.nMan(total.toStringAsFixed(2)),
                  style: AppTextStyle.bold16.copyWith(height: 1.3),
                )
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AppButton(
              label: S.current.continueButton,
              type: ButtonType.black,
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) => const ShippingOptionsSelector(),
                ).then((shippingOption) {
                  if (context.read<ProfileBloc>().profile != null) {
                    _showProfileConfirmationBottomSheet(context);
                  } else {
                    AppFlash.bigToast(
                        context: context,
                        message: S.current.signInForMakeOrder);
                    context
                        .read<MainBloc>()
                        .add(const MainTabChanged(index: 4));
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showProfileConfirmationBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          if (profileState is ProfileLoadSuccess) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProfileCard(profileState.profile, showAsSheet: true),
                  const SizedBox(height: 16),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) => AppButton(
                      label: S.current.makeOrder,
                      iconFile: 'basket.png',
                      isLoading: state.st == CartSt.loading,
                      onPressed: () =>
                          context.read<CartBloc>().add(CartOrderPlaced()),
                    ),
                  )
                ],
              ),
            );
          } else if (profileState is ProfileLoadError) {
            return AppErrorScreen(
              message: profileState.message,
              onPressed: () =>
                  context.read<ProfileBloc>().add(ProfileStarted()),
            );
          }
          return const AppProgressIndicator();
        },
      ),
    );
  }
}
