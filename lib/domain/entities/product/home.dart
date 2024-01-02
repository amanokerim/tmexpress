import 'banner.dart';
import 'tag.dart';

class Home {
  Home({
    required this.banners,
    required this.tags,
  }) {
    aBanners = banners.where((b) => b.size == BannerSize.a).toList();
    bBanners = banners.where((b) => b.size == BannerSize.b).toList();
  }
  final List<Banner> banners;
  final List<Tag> tags;
  late List<Banner> aBanners, bBanners;
}
