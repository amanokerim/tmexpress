import 'dart:async';

import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/env/env.dart';
import '../../../app/generated/l10n.dart';
import '../../../app/injection/injection.dart';
import '../../utils/app_flash.dart';
import '../../utils/constants.dart';
import '../home/home_screen.dart';
import 'bloc/start_bloc.dart';

bool _backButtonPressedOneTime = false;

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: BlocBuilder<StartBloc, StartState>(
        builder: (_, state) {
          return GestureDetector(
            onLongPress: () {
              // TODO Remove on release
              if (Env.value.showAlice) getIt<Alice>().showInspector();
            },
            child: AnimatedSwitcher(
              duration: kAnimationDuration,
              child: Container(
                key: UniqueKey(),
                child: Builder(
                  builder: (_) {
                    if (state is StartShowOnboarding) {
                      // TODO return onboarding page
                    } else if (state is StartShowAuth) {
                      // TODO return auth page
                    } else if (state is StartShowHome) {
                      return const HomeScreen();
                    } else if (state is StartShowTechnicalWorksScreen) {
                      return const Center(child: Text('Technical works'));
                    } else if (state is StartShowUpdateScreen) {
                      return const Center(child: Text('Please Update an app'));
                    }
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ),
            ),
          );
        },
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
