import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/product_mini.dart';
import '../../../../domain/entities/tag.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/product_card.dart';
import '../products/products_page.dart';

class TagWidget extends StatelessWidget {
  const TagWidget(this.tag, {Key? key}) : super(key: key);
  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(tag.title, style: AppTextStyle.bold20),
            TextButton(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => ProductsPage(
                            type: ProductsScreenType.tag, id: tag.id),
                      ),
                    ),
                child: Text(S.current.all)),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: tag.product.length,
            itemBuilder: (_, index) => ProductCard(tag.product[index]),
            separatorBuilder: (_, __) => const SizedBox(width: 16),
          ),
        ),
      ],
    );
  }
}
