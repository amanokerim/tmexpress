import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../app/generated/l10n.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_button.dart';
import 'bloc/start_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  void onDone(BuildContext context) =>
      context.read<StartBloc>().add(StartOnboardingComplete());

  @override
  Widget build(BuildContext context) {
    const pageDecoration =
        PageDecoration(imageFlex: 2, titlePadding: EdgeInsets.only(bottom: 8));
    return IntroductionScreen(
      onDone: () => onDone(context),
      done: AppButton(label: S.current.start, onPressed: () => onDone(context)),
      next: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(S.current.next, style: AppTextStyle.bold16),
      ),
      pages: [
        PageViewModel(
          title: S.current.page1title,
          body: S.current.page1subtitle,
          decoration: pageDecoration,
          image: Image.asset('assets/illustrations/find.png'),
        ),
        PageViewModel(
          title: S.current.page2title,
          body: S.current.page2subtitle,
          decoration: pageDecoration,
          image: Image.asset('assets/illustrations/order.png'),
        ),
        PageViewModel(
          title: S.current.page3title,
          body: S.current.page3subtitle,
          decoration: pageDecoration,
          image: Image.asset('assets/illustrations/get.png'),
        ),
      ],
    );
  }
}
