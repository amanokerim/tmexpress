import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/generated/l10n.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_confirm_dialog.dart';
import '../../widgets/app_progress_indicator.dart';
import '../auth/auth_page.dart';
import 'bloc/profile_bloc.dart';
import 'favorites_screen.dart';
import 'placed_orders/placed_orders_page.dart';
import 'widgets/profile_card.dart';
import 'widgets/profile_error.dart';

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
            // const SizedBox(height: 16),
            // ReferralCard(state.profile),
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
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (_) => const PlacedOrdersPage()),
              ),
            ),
            const SizedBox(height: 16),
            AppButton(
              label: S.current.share,
              iconFile: 'share.png',
              isLoading: state.profileLoad == ProfileLoad.share,
              type: ButtonType.outline,
              onPressed: () =>
                  context.read<ProfileBloc>().add(ProfileShareRequested()),
            ),
            const SizedBox(height: 16),
            AppButton(
                label: S.current.logOut,
                iconFile: 'logout.png',
                type: ButtonType.black,
                onPressed: () => _signOut(context)),
          ],
        );
      } else if (state is ProfileLoadError) {
        return ProfileError(state.message);
      }
      return const AppProgressIndicator();
    });
  }

  Future<void> _signOut(BuildContext context) async {
    final confirm = await showDialog<bool>(
        context: context,
        builder: (_) => AppDialog(
            title: S.current.confirmSignOut,
            content: S.current.confirmSignOutContent,
            positiveButtonLabel: S.current.yes));
    if (confirm == true) {
      context.read<ProfileBloc>().add(ProfileSignOutRequested());
    }
  }
}
