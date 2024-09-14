import 'package:flutter/material.dart';

import '../../../../domain/entities/product/category.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';
import '../category_screen.dart';

class CategoryW extends StatelessWidget {
  const CategoryW(this.category, {Key? key}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (_) => CategoryScreen(category: category))),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              category.categoryImage,
              height: 60,
              borderRadius: BorderRadius.circular(0),
            ),
            const SizedBox(height: 4),
            Text(
              category.title,
              style: AppTextStyle.dark14,
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
