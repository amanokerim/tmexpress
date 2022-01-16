import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/product.dart';
import '../../../theme/app_theme.dart';

class ProductSizes extends StatelessWidget {
  const ProductSizes(this.product, {Key? key}) : super(key: key);
  final Product product;

  List<Widget> widgets() {
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 10),
        child: Text(S.current.productSizes, style: AppTextStyle.bold16),
      ),
      SizedBox(
        height: 36,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          itemCount: product.size.length,
          itemBuilder: (_, index) => Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.lGrey, width: .5),
            ),
            child: Text(product.size[index].title, style: AppTextStyle.bold14),
          ),
          separatorBuilder: (_, __) => const SizedBox(width: 12),
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
