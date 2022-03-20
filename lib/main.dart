import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/env/development.dart';
import 'app/env/env.dart';
import 'app/generated/l10n.dart';
import 'app/injection/injection.dart';
import 'presentation/screens/cart/bloc/cart_bloc.dart';
import 'presentation/screens/main/bloc/main_bloc.dart';
import 'presentation/screens/start/bloc/start_bloc.dart';
import 'presentation/screens/start/start_screen.dart';
import 'presentation/theme/app_theme.dart';
import 'presentation/utils/constants.dart';

Future<void> main() async => Development().init();

class FlutterApp extends StatelessWidget {
  const FlutterApp(this.env, {Key? key}) : super(key: key);
  final Env env;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<StartBloc>(create: (_) => getIt()),
          BlocProvider<CartBloc>(create: (_) => getIt()),
        ],
        child: BlocProvider<MainBloc>(
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
              home: const StartScreen()),
        ),
      );
}

// Filter/sort
// Profile
// Show profile data confirming dialog on order place
// Referral system
// Test/refine/refactor
// Logo/splash
// dio cache
// handle 401


// Refine ideas
// Shrink and pin profile card on scroll


// TODO Back button in a same brightness with status bar
// TODO Setup slivers to the detail screen
// TODO Encode code in login and register


//////////////////////////////////////
// https://iconscout.com/contributors/manypixels-gallery
// https://smashicons.com/
// https://www.flaticon.com/authors/inkubators
// https://www.freepik.com/
// https://www.flaticon.com/authors/vitaly-gorbachev
// https://www.flaticon.com/authors/icongeek26