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
import 'presentation/screens/profile/bloc/profile_bloc.dart';
import 'presentation/screens/shipping_options/bloc/shipping_options_bloc.dart';
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
          BlocProvider<CartBloc>(create: (_) => getIt(), lazy: false),
          BlocProvider<ShippingOptionsBloc>(
              create: (_) => getIt()..add(const ShippingOptionsRequested()),
              lazy: false),
          BlocProvider<MainBloc>(create: (_) => getIt()),
          BlocProvider<ProfileBloc>(create: (context) => getIt()),
        ],
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
      );
}

// FRONT-END
// Favorites screen error
// Logo/splash
// Test/refine

// TEST 
// Dynamic link apple integration (test)

// BACK-END
// price on OrderItem model
// order by on tag products
// Admin panel product image mini generation


//////////////////////////////////////
// https://iconscout.com/contributors/manypixels-gallery
// https://www.flaticon.com/authors/vitaly-gorbachev
// https://smashicons.com/
// https://www.flaticon.com/authors/inkubators
// https://www.freepik.com/
// https://www.flaticon.com/authors/icongeek26
// https://www.freepik.com/stories
