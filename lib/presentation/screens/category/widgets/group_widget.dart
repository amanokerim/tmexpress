import 'package:flutter/material.dart';

import '../../../../domain/entities/group.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';

class GroupWidget extends StatelessWidget {
  const GroupWidget(this.group, {Key? key}) : super(key: key);
  final Group group;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(group.title, style: AppTextStyle.bold20),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: .6,
          ),
          itemCount: group.subCategories.length,
          itemBuilder: (_, index) {
            final sub = group.subCategories[index];
            return Column(
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
            );
          },
        ),
      ],
    );
  }
}
