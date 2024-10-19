import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection/injection.dart';
import '../../../domain/entities/product/sub_tag.dart';
import 'bloc/filter/filter_bloc.dart';
import 'bloc/products_bloc.dart';
import 'products_screen.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({required this.productParent, super.key});
  final SubTag productParent;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(create: (context) => getIt()),
        BlocProvider<FilterBloc>(
          create: (context) =>
              getIt()..add(FilterSizesRequested(productParent.id)),
        ),
      ],
      child: ProductsScreen(productParent: productParent),
    );
  }
}
