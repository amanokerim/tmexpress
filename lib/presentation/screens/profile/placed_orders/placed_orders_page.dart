import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection/injection.dart';
import 'bloc/placed_orders_bloc.dart';
import 'placed_orders_screen.dart';

class PlacedOrdersPage extends StatelessWidget {
  const PlacedOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlacedOrdersBloc>(
      create: (context) => getIt()..add(PlacedOrdersStarted()),
      child: const PlacedOrdersScreen(),
    );
  }
}
