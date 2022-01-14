import 'banner.dart';
import 'tag.dart';

class Home {
  const Home({
    required this.banners,
    required this.tags,
  });
  final List<Banner> banners;
  final List<Tag> tags;
}
