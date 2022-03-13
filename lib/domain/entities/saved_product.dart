class SavedProduct {
  const SavedProduct({
    required this.id,
    required this.title,
  });

  factory SavedProduct.fromJson(Map<String, dynamic> json) =>
      SavedProduct(id: json['id'], title: json['title']);

  Map<String, dynamic> toJson() => {'id': id, 'title': title};

  final int id;
  final String title;
}
