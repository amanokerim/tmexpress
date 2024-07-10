import '../../../app/generated/l10n.dart';
import '../../../domain/entities/bottom_tab.dart';
import '../category/category_screen.dart';
import '../home/home_screen.dart';
import '../hot/hot_screen.dart';
import '../media/media_list_page.dart';
import '../profile/profile_screen.dart';

String bottomTabTitle(int index) {
  if (index == 0) return S.current.homeScreen;
  if (index == 1) return S.current.hot;
  if (index == 2) return S.current.categories;
  if (index == 3) return S.current.media;
  if (index == 4) return S.current.profile;
  return '';
}

const bottomTabs = <BottomTab>[
  BottomTab(
    index: 0,
    icon: 'home',
    screen: HomeScreen(),
  ),
  BottomTab(
    index: 1,
    icon: 'fire',
    screen: HotScreen(),
  ),
  BottomTab(
    index: 2,
    icon: 'category',
    screen: CategoryScreen(),
  ),
  BottomTab(
    index: 3,
    icon: 'media',
    screen: MediaListPage(),
  ),
  BottomTab(
    index: 4,
    icon: 'profile',
    screen: ProfileScreen(),
  ),
];
