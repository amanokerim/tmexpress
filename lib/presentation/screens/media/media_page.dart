import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/injection/injection.dart';
import 'bloc/media_bloc.dart';
import 'media_screen.dart';

class HotPage extends StatelessWidget {
  const HotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MediaBloc>(
      create: (context) => getIt(),
      child: const MediaScreen(),
    );
  }
}
