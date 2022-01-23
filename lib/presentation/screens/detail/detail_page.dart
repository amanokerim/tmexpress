import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/injection/injection.dart';
import '../../../domain/entities/product_mini.dart';
import 'bloc/detail_bloc.dart';
import 'detail_screen.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.product, {Key? key}) : super(key: key);
  final ProductMini product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailBloc>(
      create: (context) => getIt()..add(DetailRequested(product.id)),
      child: DetailScreen(product),
    );
  }
}
