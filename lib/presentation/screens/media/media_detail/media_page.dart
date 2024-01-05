import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection/injection.dart';
import '../../../widgets/app_error.dart';
import '../../../widgets/app_loader.dart';
import 'cubit/media_cubit.dart';
import 'media_screen.dart';

class MediaDetailPage extends StatelessWidget {
  const MediaDetailPage(this.id, {Key? key}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MediaCubit>(
      create: (_) => getIt()..load(id),
      child: BlocBuilder(builder: (_, state) {
        if (state is MediaSuccess) {
          return MediaScreen(media: state.media);
        } else if (state is MediaError) {
          return AppErrorScreen(
              message: state.message,
              onPressed: () => context.read<MediaCubit>().load(id));
        }
        return const AppLoader();
      }),
    );
  }
}
