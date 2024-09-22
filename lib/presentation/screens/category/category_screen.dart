import 'package:flutter/material.dart';

import '../../../app/generated/l10n.dart';
import '../../../domain/entities/product/category.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_button.dart';
import '../../widgets/primary_app_bar.dart';
import '../products/products_page.dart';
import 'widgets/group_expansion_tile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    required this.category,
    Key? key,
  }) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    final groups =
        category.groups.where((g) => g.subCategories.isNotEmpty).toList();
    return Scaffold(
      appBar: PrimaryAppBar(label: category.title),
      body: Theme(
        data: ThemeData(dividerColor: AppColors.lGrey),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GroupExpansionTile(groups[index]),
                childCount: groups.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: AppButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => ProductsPage(productParent: category),
                    ),
                  ),
                  type: ButtonType.outline,
                  label: '',
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(S.current.all,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.bold16),
                        ),
                        Image.asset('assets/icons/angle-right.png', width: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
