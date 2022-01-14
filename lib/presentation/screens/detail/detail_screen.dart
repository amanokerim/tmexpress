import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_mini.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_progress_indicator.dart';
import '../../widgets/primary_app_bar.dart';
import 'bloc/detail_bloc.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.product, {Key? key}) : super(key: key);
  final ProductMini product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(label: product.title),
      body: BlocBuilder<DetailBloc, DetailState>(builder: (_, state) {
        if (state is DetailLoadSuccess) {
          return const Text('Success');
        } else if (state is DetailLoadError) {
          return AppError(
            message: state.message,
            onPressed: () =>
                context.read<DetailBloc>().add(DetailRequested(product.id)),
          );
        }
        return const AppProgressIndicator();
      }),
    );
  }
}
