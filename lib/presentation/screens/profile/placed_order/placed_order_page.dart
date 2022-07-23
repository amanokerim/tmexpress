import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection/injection.dart';
import '../../../../domain/entities/order/placed_order.dart';
import 'bloc/placed_order_bloc.dart';
import 'placed_order_screen.dart';

class PlacedOrderPage extends StatelessWidget {
  const PlacedOrderPage(this.order, {Key? key}) : super(key: key);
  final PlacedOrder order;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlacedOrderBloc>(
      create: (context) => getIt()..add(PlacedOrderStarted(order.id)),
      child: PlacedOrderScreen(order),
    );
  }
}
