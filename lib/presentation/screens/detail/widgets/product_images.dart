import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/product.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';
import '../bloc/detail_bloc.dart';

class ProductImages extends StatelessWidget {
  const ProductImages(this.product, {Key? key}) : super(key: key);
  final Product product;

  List<Widget> widgets() {
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
        child: Text(S.current.productColors, style: AppTextStyle.bold16),
      ),
      SizedBox(
        height: 64,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          itemCount: product.productImages.length,
          itemBuilder: (context, index) => InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => context
                  .read<DetailBloc>()
                  .add(DetailColorChanged(product.productImages[index])),
              child: AppImage(product.productImages[index].urlMini, width: 64)),
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          scrollDirection: Axis.horizontal,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
