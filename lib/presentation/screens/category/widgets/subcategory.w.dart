import 'package:flutter/material.dart';

import '../../../../domain/entities/subcategory.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';
import '../../products/products_page.dart';

class SubcategoryW extends StatelessWidget {
  const SubcategoryW(this.sub, {Key? key}) : super(key: key);
  final Subcategory sub;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => ProductsPage(productParent: sub),
        ),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: AppImage(sub.subCategoryImage),
          ),
          const SizedBox(height: 8),
          Text(sub.title,
              style: AppTextStyle.dark14,
              textAlign: TextAlign.center,
              maxLines: 2),
        ],
      ),
    );
  }
}
