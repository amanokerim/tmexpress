import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection/injection.dart';
import '../../../../domain/entities/profile.dart';
import 'bloc/edit_profile_bloc.dart';
import 'edit_profile_screen.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage(this.profile, {Key? key}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileBloc>(
      create: (context) => getIt()..add(EditProfileStarted(profile)),
      child: EditProfileScreen(profile),
    );
  }
}
