import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/generated/l10n.dart';
import '../../../theme/app_theme.dart';
import '../bloc/detail_bloc.dart';
import 'size.w.dart';

class ProductSizes extends StatelessWidget {
  const ProductSizes(this.state, {super.key});
  final DetailLoadSuccess state;

  List<Widget> widgets(BuildContext context) {
    final sizes = state.product.size;

    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 24 - 6, 20, 10 - 6),
        child: Text(S.current.productSizes, style: AppTextStyle.bold16),
      ),
      SizedBox(
        height: 60,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          physics: const BouncingScrollPhysics(),
          itemCount: sizes.length,
          itemBuilder: (_, index) => SizeW(
            sizes[index],
            selected: sizes[index] == state.selectedSize,
            onPressed: () =>
                context.read<DetailBloc>().add(DetailSizeChanged(sizes[index])),
            alignment: Alignment.center,
          ),
          scrollDirection: Axis.horizontal,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
