import 'package:flutter/material.dart';

import '../../../app/generated/l10n.dart';
import '../../../domain/entities/enums/region.dart';
import '../../../domain/entities/profile.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_button.dart';
import 'widgets/profile_image.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(this.profile, {Key? key}) : super(key: key);
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bg2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (profile.gender != null) ProfileAvatar(profile.gender!),
          Text(profile.phone, style: AppTextStyle.bold20),
          if (profile.name != null)
            Text(
              profile.name!,
              style: AppTextStyle.bold18.copyWith(fontWeight: FontWeight.w900),
            ),
          if (profile.address != null || profile.region != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(style: AppTextStyle.grey16, children: [
                  WidgetSpan(
                    child: Icon(Icons.place, color: AppColors.grey, size: 20),
                  ),
                  if (profile.region != null)
                    TextSpan(text: profile.region!.str),
                  if (profile.address != null && profile.region != null)
                    const TextSpan(text: ', '),
                  if (profile.address != null) TextSpan(text: profile.address),
                ]),
              ),
            ),
          const SizedBox(height: 16),
          AppButton(
            label: profile.name != null ? S.current.edit : S.current.fill,
            type: ButtonType.outline,
            iconFile: 'edit.png',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
