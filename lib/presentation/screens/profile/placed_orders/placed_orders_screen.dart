import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../widgets/app_error.dart';
import '../../../widgets/app_progress_indicator.dart';
import '../../../widgets/primary_app_bar.dart';
import 'bloc/placed_orders_bloc.dart';

class PlacedOrdersScreen extends StatelessWidget {
  const PlacedOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(label: S.current.orders),
      body:
          BlocBuilder<PlacedOrdersBloc, PlacedOrdersState>(builder: (_, state) {
        if (state is PlacedOrdersSuccess) {
          return ListView.separated(
            itemCount: state.orders.length,
            itemBuilder: (_, index) =>
                Text(state.orders[index].totalPrice.toString()),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
          );
        } else if (state is PlacedOrdersError) {
          return AppError(
            message: state.message,
            onPressed: () =>
                context.read<PlacedOrdersBloc>().add(PlacedOrdersStarted()),
          );
        }
        return const AppProgressIndicator();
      }),
    );
  }
}
