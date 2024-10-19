import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/injection/injection.dart';
import 'bloc/detail_bloc.dart';
import 'detail_screen.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.productId, {super.key});
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailBloc>(
      create: (context) => getIt()..add(DetailRequested(productId)),
      child: DetailScreen(productId),
    );
  }
}
