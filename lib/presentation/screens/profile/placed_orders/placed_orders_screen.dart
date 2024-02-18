import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../widgets/app_cart_button.dart';
import '../../../widgets/app_empty.dart';
import '../../../widgets/app_error.dart';
import '../../../widgets/app_loader.dart';
import '../../../widgets/primary_app_bar.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/placed_order_card.dart';
import 'bloc/placed_orders_bloc.dart';

class PlacedOrdersScreen extends StatelessWidget {
  const PlacedOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        label: S.current.orders,
        action: const Padding(
          padding: EdgeInsets.only(right: 15),
          child: AppCartButton(size: 28),
        ),
      ),
      body: BlocConsumer<PlacedOrdersBloc, PlacedOrdersState>(
        listener: (_, state) {
          if (state is PlacedOrdersError && state.error.isAuth) {
            Navigator.of(context).pop();
            context.read<ProfileBloc>().add(ProfileStarted());
          }
        },
        builder: (_, state) {
          if (state is PlacedOrdersSuccess) {
            final length = state.orders.length;
            if (length == 0) return AppEmpty(message: S.current.noOrders);
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: length,
              itemBuilder: (_, index) => PlacedOrderCard(state.orders[index]),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
            );
          } else if (state is PlacedOrdersError) {
            return AppErrorScreen(
              message: state.error.message,
              onPressed: () =>
                  context.read<PlacedOrdersBloc>().add(PlacedOrdersStarted()),
            );
          }
          return const AppLoader();
        },
      ),
    );
  }
}
