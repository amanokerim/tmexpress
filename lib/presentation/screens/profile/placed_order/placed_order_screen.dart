import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/placed_order.dart';
import '../../../utils/date_extension.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_empty.dart';
import '../../../widgets/app_error.dart';
import '../../../widgets/app_progress_indicator.dart';
import '../../../widgets/primary_app_bar.dart';
import '../widgets/placed_order_card.dart';
import '../widgets/placed_order_item_card.dart';
import 'bloc/placed_order_bloc.dart';

class PlacedOrderScreen extends StatelessWidget {
  const PlacedOrderScreen(this.order, {Key? key}) : super(key: key);
  final PlacedOrder order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(label: order.createdAt.dmYHm),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: PlacedOrderCard(order),
          ),
          Expanded(
            child: BlocBuilder<PlacedOrderBloc, PlacedOrderState>(
                builder: (_, state) {
              if (state is PlacedOrderSuccess) {
                if (state.order.orderitems.isEmpty) {
                  return const AppEmpty(message: '');
                }
                final items = state.order.orderitems;
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  itemBuilder: (_, index) => PlacedOrderItemCard(items[index]),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                );
              } else if (state is PlacedOrderError) {
                return AppError(
                    message: state.message,
                    onPressed: () => context
                        .read<PlacedOrderBloc>()
                        .add(PlacedOrderStarted(order.id)));
              }
              return const AppProgressIndicator();
            }),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: AppButton(label: 'Jaň etmek', onPressed: () {}),
      ),
    );
  }
}