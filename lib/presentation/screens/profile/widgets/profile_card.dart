import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/enums/region.dart';
import '../../../../domain/entities/profile.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/card_wrapper.dart';
import '../bloc/profile_bloc.dart';
import '../edit_profile/edit_profile_page.dart';
import 'profile_image.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(this.profile, {this.showAsSheet = false, super.key});
  final Profile profile;
  final bool showAsSheet;

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      backgroundColor: showAsSheet ? Colors.white : null,
      padding: showAsSheet
          ? EdgeInsets.zero
          : const EdgeInsets.fromLTRB(20, 30, 20, 30),
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
          SizedBox(height: showAsSheet ? 48 : 16),
          AppButton(
            label: profile.name != null ? S.current.edit : S.current.fill,
            type: ButtonType.black,
            iconFile: 'edit.png',
            onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (_) => BlocProvider<ProfileBloc>.value(
                value: context.read<ProfileBloc>(),
                child: EditProfilePage(profile),
              ),
            )),
          )
        ],
      ),
    );
  }
}
