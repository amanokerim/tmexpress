import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_error.dart';
import '../../../widgets/app_image.dart';
import '../../../widgets/app_progress_indicator.dart';
import '../../profile/bloc/profile_bloc.dart';
import '../../shipping_options/bloc/shipping_options_bloc.dart';
import '../bloc/cart_bloc.dart';

class ShippingOptionsSelector extends StatelessWidget {
  const ShippingOptionsSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShippingOptionsBloc, ShippingOptionsState>(
      builder: (context, state) {
        if (state is ShippingOptionsLoadSuccess) {
          return BlocBuilder<ShippingOptionsBloc, ShippingOptionsState>(
            builder: (context, shippingOptionsState) {
              if (shippingOptionsState is ShippingOptionsLoadError) {
                return AppErrorScreen(
                    message: shippingOptionsState.message,
                    onPressed: () => context
                        .read<ShippingOptionsBloc>()
                        .add(const ShippingOptionsRequested()));
              } else if (shippingOptionsState is ShippingOptionsLoadSuccess) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 32, 20, 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.current.selectShippingOption,
                        style: AppTextStyle.black16,
                      ),
                      const SizedBox(height: 20),
                      ...shippingOptionsState.shippingOptions.map(
                        (so) => ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.only(left: 12),
                          visualDensity: VisualDensity.compact,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          title: Row(
                            children: [
                              AppImage(
                                so.image,
                                width: 32,
                                borderRadius: BorderRadius.circular(0),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      so.title,
                                      style: AppTextStyle.bold16,
                                    ),
                                    Text(
                                      so.duration,
                                      style: AppTextStyle.grey14,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                width: 80,
                                child: Column(
                                  children: [
                                    Text(
                                      '${so.price.toStringAsFixed(0)}m',
                                      style: AppTextStyle.black16,
                                    ),
                                    Text(
                                      so.priceUnit,
                                      style: AppTextStyle.grey12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            context.read<CartBloc>().add(
                                CartShippingOptionChanged(shippingOption: so));
                            Navigator.of(context).pop(so);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: AppProgressIndicator());
            },
          );
        } else if (state is ShippingOptionsLoadError) {
          return AppErrorScreen(
            message: state.message,
            onPressed: () => context.read<ProfileBloc>().add(ProfileStarted()),
          );
        }
        return const AppProgressIndicator();
      },
    );
  }
}
