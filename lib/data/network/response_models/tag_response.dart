class TagResponse {
  TagResponse({
    this.id,
    this.title,
    this.product,
  });
  final int? id;
  final String? title;
  // TODO Change to ProductMiniResponse
  final List<int>? product;
}
