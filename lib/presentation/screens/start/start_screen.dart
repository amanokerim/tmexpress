import 'dart:async';

import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/generated/l10n.dart';
import '../../../app/injection/injection.dart';
import '../../utils/app_flash.dart';
import '../../utils/constants.dart';
import '../../widgets/app_progress_indicator.dart';
import '../main/bloc/main_bloc.dart';
import '../main/main_screen.dart';
import 'bloc/start_bloc.dart';
import 'onboarding_screen.dart';

bool _backButtonPressedOneTime = false;

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // final _fcmHandler = FCMHandler();

  @override
  void initState() {
    super.initState();
    // DeepLinker.init(context);
  }

  @override
  void dispose() {
    // _fcmHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: BlocConsumer<StartBloc, StartState>(
        listener: (_, state) {
          // if (state is StartSetUpFCMListener) {
          //   _fcmHandler.init(context, state.fcmStream);
          // }
        },
        builder: (_, state) => GestureDetector(
          onLongPress: () {
            // TODO Remove on release
            if (kDebugMode) getIt<Alice>().showInspector();
          },
          child: AnimatedSwitcher(
            duration: kAnimationDuration,
            // ignore: avoid_unnecessary_containers
            child: Container(
              // TODO Uncomment on production
              // key: UniqueKey(),
              child: Builder(
                builder: (_) {
                  if (state is StartShowOnboarding) {
                    return const OnboardingScreen();
                  } else if (state is StartShowHome) {
                    context
                        .read<MainBloc>()
                        .add(MainTabChanged(index: state.tab));
                    return const MainScreen();
                  } else if (state is StartShowTechnicalWorksScreen) {
                    return const Center(child: Text('Technical works'));
                  } else if (state is StartShowUpdateScreen) {
                    return const Center(child: Text('Please Update an app'));
                  }
                  return const Scaffold(
                    body: AppProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    if (_backButtonPressedOneTime) return true;
    _backButtonPressedOneTime = true;

    Future.delayed(
      kToastDuration,
      () => _backButtonPressedOneTime = false,
    );
    await AppFlash.toast(context: context, message: S.current.doubleBackToExit);

    return false;
  }
}
