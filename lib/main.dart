import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/env/development.dart';
import 'app/env/env.dart';
import 'app/generated/l10n.dart';
import 'app/injection/injection.dart';
import 'presentation/screens/home/bloc/home_bloc.dart';
import 'presentation/screens/start/bloc/start_bloc.dart';
import 'presentation/screens/start/start_screen.dart';
import 'presentation/theme/app_theme.dart';
import 'presentation/utils/constants.dart';

Future<void> main() async => Development().init();

class FlutterApp extends StatelessWidget {
  const FlutterApp(this.env, {Key? key}) : super(key: key);
  final Env env;

  @override
  Widget build(BuildContext context) => BlocProvider<StartBloc>(
        create: (_) => getIt(),
        child: BlocProvider<HomeBloc>(
          create: (_) => getIt(),
          child: MaterialApp(
            title: kAppName,
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            navigatorKey: getIt<Alice>().getNavigatorKey(),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: appTheme,
            home: const StartScreen(),
          ),
        ),
      );
}

// TODO Test Firebase Analytics (no data on Firebase console)
// TODO Install second splash screen with custom animation
// TODO Write CheckList for starting project with template
// TODO 
// TODO 
