import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/generated/l10n.dart';
import '../../../app/injection/injection.dart';
import '../../../data/local/data_keys.dart';
import '../../../domain/entities/bottom_tab.dart';
import '../../../domain/repositories/preferences_repository.dart';
import '../../../main.dart';
import '../../theme/app_theme.dart';
import '../../utils/constants.dart';
import '../../widgets/app_bottom_navigation_bar.dart';
import '../../widgets/app_cart_button.dart';
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
          language =
              getIt<PreferencesRepository>().getStringPreference(pLang) ?? 'tr';
          isRu = language == 'ru';

          return Scaffold(
            backgroundColor: AppColors.bgMain,
            appBar: tab.index == 0
                ? _homeAppBar()
                : PrimaryAppBar(
                    label: tab.title,
                    action: const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: AppCartButton(size: 24),
                    ),
                  ),
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

  SearchAppBar _homeAppBar() {
    return SearchAppBar(
      leading: GestureDetector(
        onTap: () {
          setState(() {
            final newL = language == 'tr' ? 'ru' : 'tr';
            S.load(Locale(newL));
            getIt<PreferencesRepository>().setPreference(pLang, newL);
          });
        },
        child: SizedBox(
          width: 44,
          child: Image.asset(
            'assets/icons/flag-$language.png',
          ),
        ),
      ),
      trailing: const AppCartButton(),
    );
  }
}
