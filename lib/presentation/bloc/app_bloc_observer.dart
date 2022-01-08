import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/env/env.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (Env.value.writeLogs) print('${bloc.runtimeType} $change');
  }
}
