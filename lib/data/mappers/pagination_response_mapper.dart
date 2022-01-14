import '../../domain/entities/pagination.dart';
import '../network/response_models/pagination_response.dart';
import 'mapper.dart';

class PaginationResponseMapper<Src, Dst>
    extends Mapper<PaginationResponse<Src>, Pagination<Dst>> {
  PaginationResponseMapper(this.mapper);
  final Mapper<Src, Dst> mapper;

  @override
  Pagination<Dst> map(PaginationResponse<Src>? entity) {
    print('=== PaginationResponseMapper ===');
    print(entity?.results);
    print(mapper.mapList(entity?.results));
    return Pagination(
      count: entity?.count ?? 0,
      next: entity?.next,
      items: mapper.mapList(entity?.results),
    );
  }
}
