import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/injection/injection.dart';
import 'bloc/hot_bloc.dart';
import 'hot_screen.dart';

class HotPage extends StatelessWidget {
  const HotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HotBloc>(
      create: (context) => getIt(),
      child: const HotScreen(),
    );
  }
}
