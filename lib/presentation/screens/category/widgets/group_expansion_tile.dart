import 'package:flutter/material.dart';

import '../../../../domain/entities/product/group.dart';
import '../../../theme/app_theme.dart';
import 'subcategory.w.dart';

class GroupExpansionTile extends StatelessWidget {
  const GroupExpansionTile(this.group, {Key? key}) : super(key: key);
  final Group group;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(group.title, style: AppTextStyle.bold20),
      tilePadding: const EdgeInsets.symmetric(horizontal: 20),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.grey[50],
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: .65,
          ),
          itemCount: group.subCategories.length,
          itemBuilder: (_, index) => SubcategoryW(group.subCategories[index]),
        ),
      ],
    );
  }
}
