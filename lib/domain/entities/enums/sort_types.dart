import '../../../app/generated/l10n.dart';

enum SortType {
  time,
  priceAsc,
  priceDesc,
  ourRating,
  hot,
  weightAsc,
  weightDesc
}

extension SortTypesX on SortType {
  String get title {
    switch (this) {
      case SortType.time:
        return S.current.sortTime;
      case SortType.priceAsc:
        return S.current.sortPriceAsc;
      case SortType.priceDesc:
        return S.current.sortPriceDesc;
      case SortType.ourRating:
        return S.current.sortOurRating;
      case SortType.hot:
        return S.current.sortHot;
      case SortType.weightAsc:
        return S.current.sortWeightAsc;
      case SortType.weightDesc:
        return S.current.sortWeightDesc;
    }
  }

  String get orderBy {
    switch (this) {
      case SortType.time:
        return '-createdAt';
      case SortType.priceAsc:
        return 'rootPrice'; // TODO Migrate to calculated price
      case SortType.priceDesc:
        return '-rootPrice';
      case SortType.ourRating:
        return '-ourRating';
      case SortType.hot:
        return '-sortByHot'; // TODO TEST IT AFTER SERVER UPDATE
      case SortType.weightAsc:
        return 'weight';
      case SortType.weightDesc:
        return '-weight';
    }
  }
}
