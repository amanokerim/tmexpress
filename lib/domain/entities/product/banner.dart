enum BannerType { product, category, tag }

class Banner {
  const Banner({
    required this.title,
    required this.image,
    required this.type,
    required this.entityId,
  });

  final String title;
  final String image;
  final BannerType type;
  final int entityId;
}
