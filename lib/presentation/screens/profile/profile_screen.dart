import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/generated/l10n.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_progress_indicator.dart';
import '../auth/auth_page.dart';
import 'bloc/profile_bloc.dart';
import 'favorites_screen.dart';
import 'widgets/profile_card.dart';
import 'widgets/referral_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (_, state) {
      print('** $state');
      if (state is ProfileNotAuthorized) {
        return const AuthPage();
      } else if (state is ProfileLoadSuccess) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ProfileCard(state.profile),
            const SizedBox(height: 16),
            ReferralCard(state.profile),
            const SizedBox(height: 16),
            AppButton(
              label: S.current.favorites,
              type: ButtonType.outline,
              iconFile: 'like.png',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (_) => const FavoritesScreen()),
              ),
            ),
            const SizedBox(height: 16),
            AppButton(
              label: S.current.orders,
              type: ButtonType.outline,
              iconFile: 'order_history.png',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            AppButton(
              label: S.current.share,
              iconFile: 'share.png',
              type: ButtonType.outline,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            AppButton(
              label: S.current.logOut,
              iconFile: 'logout.png',
              type: ButtonType.black,
              onPressed: () {},
            ),
          ],
        );
      } else if (state is ProfileLoadError) {
        return AppError(
            message: state.message,
            onPressed: () => context.read<ProfileBloc>().add(ProfileStarted()));
      }
      return const AppProgressIndicator();
    });
  }
}
