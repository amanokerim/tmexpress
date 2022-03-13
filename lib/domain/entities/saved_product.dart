class SavedProduct {
  const SavedProduct({
    required this.id,
    required this.title,
    required this.image,
  });

  factory SavedProduct.fromJson(Map<dynamic, dynamic> json) => SavedProduct(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '');

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'image': image};

  final int id;
  final String title;
  final String image;
}
