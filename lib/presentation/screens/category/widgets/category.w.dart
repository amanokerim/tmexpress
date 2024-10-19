import 'package:flutter/material.dart';

import '../../../../domain/entities/product/category.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';
import '../category_screen.dart';

class CategoryW extends StatelessWidget {
  const CategoryW(this.category, {super.key});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (_) => CategoryScreen(category: category))),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppImage(
              category.categoryImage,
              height: 98,
              width: 98,
              borderRadius: BorderRadius.circular(12),
            ),
            const SizedBox(height: 4),
            Text(
              category.title,
              style: AppTextStyle.bold14,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
