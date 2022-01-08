import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/product_bloc.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (_, state) {
        if (state is ProductLoadSuccess) {
          return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (_, index) => Text(state.products[index].title),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: state.products.length);
        } else if (state is ProductLoadError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
