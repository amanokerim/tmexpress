import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/generated/l10n.dart';
import '../../../app/injection/injection.dart';
import '../../../data/local/data_keys.dart';
import '../../../domain/entities/bottom_tab.dart';
import '../../../domain/repositories/preferences_repository.dart';
import '../../theme/app_theme.dart';
import '../../utils/constants.dart';
import '../../widgets/app_bottom_navigation_bar.dart';
import '../../widgets/primary_app_bar.dart';
import '../../widgets/search_app_bar.dart';
import '../category/bloc/category_bloc.dart';
import '../home/bloc/home_bloc.dart';
import '../hot/bloc/hot_bloc.dart';
import 'bloc/main_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<HomeBloc>()..add(HomeRequested())),
        BlocProvider.value(
            value: getIt<CategoryBloc>()..add(CategoriesRequested())),
        BlocProvider.value(value: getIt<HotBloc>()),
      ],
      child: BlocBuilder<MainBloc, BottomTab>(
        builder: (_, tab) {
          final language =
              getIt<PreferencesRepository>().getStringPreference(pLang) ?? 'tr';

          return Scaffold(
            backgroundColor: AppColors.bgMain,
            appBar: tab.index == 0
                ? SearchAppBar(
                    leading: GestureDetector(
                      onTap: () {
                        setState(() {
                          final newL = language == 'tr' ? 'ru' : 'tr';
                          S.load(Locale(newL));
                          getIt<PreferencesRepository>()
                              .setPreference(pLang, newL);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'assets/icons/flag-$language.png',
                        ),
                      ),
                    ),
                  )
                : PrimaryAppBar(label: tab.title),
            body: AnimatedSwitcher(
                duration: kAnimationDuration,
                child: Container(
                  key: ValueKey(tab.index),
                  child: tab.screen,
                )),
            bottomNavigationBar:
                AppBottomNavigationBar(currentIndex: tab.index),
          );
        },
      ),
    );
  }
}
