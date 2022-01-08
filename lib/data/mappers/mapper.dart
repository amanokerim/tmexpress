abstract class Mapper<Src, Dst> {
  Dst? map(Src? entity);

  List<Dst> mapList(List<Src?>? entities) =>
      entities?.map(map).toList().whereType<Dst>().toList() ??
      List<Dst>.empty();
}
