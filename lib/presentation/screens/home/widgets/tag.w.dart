import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/product/tag.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/product_card.dart';
import '../../products/products_page.dart';

class TagWidget extends StatelessWidget {
  const TagWidget(this.tag, {this.onAllPressed, Key? key}) : super(key: key);
  final Tag tag;
  final VoidCallback? onAllPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tag.title, style: AppTextStyle.bold20),
              TextButton(
                  onPressed: onAllPressed ??
                      () => Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (_) => ProductsPage(productParent: tag),
                          )),
                  child: Text(S.current.all)),
            ],
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: tag.products.length,
            itemBuilder: (_, index) =>
                ProductCard(tag.products[index], aspectRatio: .65),
            separatorBuilder: (_, __) => const SizedBox(width: 16),
          ),
        ),
      ],
    );
  }
}
