enum BannerType { product, category, tag, media }

enum BannerSize { a, b, c, d, e, f, g, h }

class Banner {
  const Banner({
    required this.title,
    required this.image,
    required this.type,
    required this.size,
    required this.entityId,
  });

  final String title;
  final String image;
  final BannerType type;
  final BannerSize size;
  final int entityId;
}
