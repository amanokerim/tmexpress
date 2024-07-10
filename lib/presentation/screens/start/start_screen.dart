import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/generated/l10n.dart';
import '../../utils/app_flash.dart';
import '../../utils/constants.dart';
import '../../widgets/app_loader.dart';
import '../main/bloc/main_bloc.dart';
import '../main/main_screen.dart';
import 'bloc/start_bloc.dart';
import 'onboarding_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // final _fcmHandler = FCMHandler();

  DateTime? currentBackPressTime;
  bool canPopNow = false;

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
    return PopScope(
      canPop: canPopNow,
      onPopInvoked: _onPopInvoked,
      child: BlocConsumer<StartBloc, StartState>(
        listener: (_, state) {
          // if (state is StartSetUpFCMListener) {
          //   _fcmHandler.init(context, state.fcmStream);
          // }
        },
        builder: (_, state) => AnimatedSwitcher(
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
                  body: AppLoader(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onPopInvoked(bool didPop) {
    final now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > kToastDuration) {
      currentBackPressTime = now;
      AppFlash.bigToast(context: context, message: S.current.doubleBackToExit);
      Future.delayed(
        kToastDuration,
        () => setState(() => canPopNow = false),
      );
      setState(() => canPopNow = true);
    }
  }
}
