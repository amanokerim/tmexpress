import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/enums/gender.dart';
import '../edit_profile/bloc/edit_profile_bloc.dart';

class EditProfileGender extends StatelessWidget {
  const EditProfileGender(this.selectedGender, {Key? key}) : super(key: key);
  final Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Gender.values
          .map(
            (gender) => Expanded(
              child: RadioListTile<Gender>(
                value: gender,
                groupValue: selectedGender,
                contentPadding: EdgeInsets.zero,
                title: Text(gender.str),
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                onChanged: (gender) => context
                    .read<EditProfileBloc>()
                    .add(EditProfileGenderChanged(gender)),
              ),
            ),
          )
          .toList(),
    );
  }
}
