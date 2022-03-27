import 'dart:async';

import 'package:alice/alice.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/env/env.dart';
import '../../../app/generated/l10n.dart';
import '../../../app/injection/injection.dart';
import '../../utils/app_flash.dart';
import '../../utils/constants.dart';
import '../../utils/deeplinker.dart';
import '../../widgets/app_progress_indicator.dart';
import '../main/main_screen.dart';
import 'bloc/start_bloc.dart';

bool _backButtonPressedOneTime = false;

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    _initDynamicLink();
  }

  Future<void> _initDynamicLink() async {
    // TODO Test deep-link with inactive app
    final dynamicLinkData =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (dynamicLinkData != null) {
      DeepLinker.handle(context, dynamicLinkData);
    }
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      DeepLinker.handle(context, dynamicLinkData);
    });
  }

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
              // ignore: avoid_unnecessary_containers
              child: Container(
                // TODO Uncomment on production
                // key: UniqueKey(),
                child: Builder(
                  builder: (_) {
                    if (state is StartShowOnboarding) {
                      // TODO return onboarding page
                    } else if (state is StartShowHome) {
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
