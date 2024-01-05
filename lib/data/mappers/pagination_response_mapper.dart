import '../../domain/entities/product/pagination.dart';
import '../network/response_models/pagination_response.dart';
import 'mapper.dart';

class PaginationResponseMapper<Src, Dst>
    extends Mapper<PaginationResponse<Src>, PaginationM<Dst>> {
  PaginationResponseMapper(this.mapper);
  final Mapper<Src, Dst> mapper;

  @override
  PaginationM<Dst> map(PaginationResponse<Src>? entity) => PaginationM(
        count: entity?.count ?? 0,
        next: entity?.next,
        items: mapper.mapList(entity?.results),
      );
}
