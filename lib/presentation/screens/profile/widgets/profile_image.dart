import 'package:flutter/material.dart';

import '../../../../domain/entities/enums/gender.dart';
import '../../../theme/app_theme.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar(this.gender, {super.key});
  final Gender gender;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.grey, width: .5),
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/illustrations/${gender.name}.png',
            width: 64,
          ),
        ),
      );
}
