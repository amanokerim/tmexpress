class Pagination<T> {
  const Pagination({
    required this.count,
    required this.next,
    required this.items,
  });

  final int count;
  final String? next;
  final List<T> items;
}
