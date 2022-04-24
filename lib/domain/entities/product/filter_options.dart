import 'size.dart';

class FilterOptions {
  const FilterOptions({
    required this.isDiscounted,
    required this.sizes,
  });

  final bool isDiscounted;
  final List<Size> sizes;
}
