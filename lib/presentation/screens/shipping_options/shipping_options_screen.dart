import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_error.dart';
import '../../widgets/app_loader.dart';
import 'bloc/shipping_options_bloc.dart';

class ShippingOptionsScreen extends StatefulWidget {
  const ShippingOptionsScreen({Key? key}) : super(key: key);

  @override
  State<ShippingOptionsScreen> createState() => _ShippingOptionsScreenState();
}

class _ShippingOptionsScreenState extends State<ShippingOptionsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShippingOptionsBloc, ShippingOptionsState>(
        builder: (_, state) {
          if (state is ShippingOptionsLoadError) {
            return AppErrorScreen(
              message: state.message,
              onPressed: () => context
                  .read<ShippingOptionsBloc>()
                  .add(const ShippingOptionsRequested()),
            );
          } else if (state is ShippingOptionsLoadSuccess) {
            return ListView.builder(
              itemCount: state.shippingOptions.length,
              itemBuilder: (_, index) =>
                  Text(state.shippingOptions[index].title),
            );
          }
          return const AppLoader();
        },
      ),
    );
  }
}
