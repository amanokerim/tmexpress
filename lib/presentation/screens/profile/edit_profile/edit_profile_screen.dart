import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/enums/load_state.dart';
import '../../../../domain/entities/enums/region.dart';
import '../../../../domain/entities/profile.dart';
import '../../../utils/app_flash.dart';
import '../../../utils/app_validator.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_drop_down.dart';
import '../../../widgets/primary_app_bar.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/gender_radio.dart';
import 'bloc/edit_profile_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen(this.profile, {Key? key}) : super(key: key);
  final Profile profile;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameC, _addressC;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameC = TextEditingController(text: widget.profile.name);
    _addressC = TextEditingController(text: widget.profile.address);
  }

  @override
  void dispose() {
    _nameC.dispose();
    _addressC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(label: S.current.editProfile),
      body: Form(
        key: _formKey,
        child: BlocConsumer<EditProfileBloc, EditProfileState>(
          listener: (_, state) {
            if (state.error != null) {
              if (state.error!.isAuth) {
                Navigator.of(context).pop();
                context.read<ProfileBloc>().add(ProfileStarted());
              } else {
                AppFlash.toast(
                    context: context,
                    message: state.error!.message,
                    isError: true);
              }
            }
            if (state.loadState == LoadState.success) {
              final newProfile = widget.profile.copyWith(
                  name: _nameC.text,
                  address: _addressC.text,
                  gender: state.gender!,
                  region: state.region!);
              context.read<ProfileBloc>().add(ProfileChanged(newProfile));
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _nameC,
                  validator: AppValidator.notEmpty,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    label: Text(S.current.name),
                  ),
                ),
                const SizedBox(height: 16),
                EditProfileGender(state.gender),
                const SizedBox(height: 16),
                AppDropDown<Region>(
                    label: S.current.region,
                    values: regions,
                    selected: state.region,
                    onItemSelected: (region) => context
                        .read<EditProfileBloc>()
                        .add(EditProfileRegionChanged(region)),
                    height: 332,
                    toStr: (region) => region.str),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _addressC,
                  validator: AppValidator.notEmpty,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (_) => _submit(),
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                    label: Text(S.current.address),
                  ),
                ),
                const SizedBox(height: 16),
                AppButton(
                    label: S.current.edit,
                    isLoading: state.loadState == LoadState.loading,
                    onPressed: _submit),
              ],
            );
          },
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<EditProfileBloc>().add(
          EditProfileSubmitted(name: _nameC.text, address: _addressC.text));
    }
  }
}
