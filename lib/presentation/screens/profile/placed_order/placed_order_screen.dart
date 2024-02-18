import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/order/placed_order.dart';
import '../../../utils/date_extension.dart';
import '../../../widgets/app_cart_button.dart';
import '../../../widgets/app_empty.dart';
import '../../../widgets/app_error.dart';
import '../../../widgets/app_loader.dart';
import '../../../widgets/primary_app_bar.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/placed_order_card.dart';
import '../widgets/placed_order_item_card.dart';
import 'bloc/placed_order_bloc.dart';

class PlacedOrderScreen extends StatelessWidget {
  const PlacedOrderScreen(this.order, {Key? key}) : super(key: key);
  final PlacedOrder order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        label: order.createdAt.dmYHm,
        action: const Padding(
          padding: EdgeInsets.only(right: 15),
          child: AppCartButton(size: 28),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: PlacedOrderCard(order, clickable: false),
          ),
          Expanded(
            child: BlocConsumer<PlacedOrderBloc, PlacedOrderState>(
                listener: (_, state) {
              if (state is PlacedOrderError && state.error.isAuth) {
                Navigator.of(context).popUntil((route) => route.isFirst);
                context.read<ProfileBloc>().add(ProfileStarted());
              }
            }, builder: (_, state) {
              if (state is PlacedOrderSuccess) {
                if (state.order.orderItems.isEmpty) {
                  return const AppEmpty(message: '');
                }
                final items = state.order.orderItems;
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  itemBuilder: (_, index) => PlacedOrderItemCard(items[index]),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                );
              } else if (state is PlacedOrderError) {
                return AppErrorScreen(
                    message: state.error.message,
                    onPressed: () => context
                        .read<PlacedOrderBloc>()
                        .add(PlacedOrderStarted(order.id)));
              }
              return const AppLoader();
            }),
          ),
        ],
      ),
    );
  }
}
