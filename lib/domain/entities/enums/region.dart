import '../../../app/generated/l10n.dart';

enum Region { none, ag, ah, bn, dz, lb, mr }
List<Region> get regions =>
    [Region.ag, Region.ah, Region.bn, Region.dz, Region.lb, Region.mr];

extension RegionX on Region {
  String get str {
    switch (this) {
      case Region.none:
        return '';
      case Region.ag:
        return S.current.ag;
      case Region.ah:
        return S.current.ah;
      case Region.bn:
        return S.current.bn;
      case Region.dz:
        return S.current.dz;
      case Region.lb:
        return S.current.lb;
      case Region.mr:
        return S.current.mr;
    }
  }
}
