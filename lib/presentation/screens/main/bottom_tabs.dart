import '../../../app/generated/l10n.dart';
import '../../../domain/entities/bottom_tab.dart';
import '../category/category_screen.dart';
import '../home/home_screen.dart';
import '../hot/hot_screen.dart';
import '../media/media_list_page.dart';
import '../profile/profile_screen.dart';

final bottomTabs = <BottomTab>[
  BottomTab(
    index: 0,
    title: S.current.homeScreen,
    icon: 'home',
    screen: const HomeScreen(),
  ),
  BottomTab(
    index: 1,
    title: S.current.categories,
    icon: 'category',
    screen: const CategoryScreen(),
  ),
  BottomTab(
    index: 2,
    title: S.current.media,
    icon: 'media',
    screen: const MediaListPage(),
  ),
  BottomTab(
    index: 3,
    title: S.current.hot,
    icon: 'fire',
    screen: const HotScreen(),
  ),
  // BottomTab(
  //   index: 3,
  //   title: S.current.cart,
  //   icon: 'basket',
  //   screen: const CartScreen(),
  // ),
  BottomTab(
    index: 4,
    title: S.current.profile,
    icon: 'profile',
    screen: const ProfileScreen(),
  ),
];
