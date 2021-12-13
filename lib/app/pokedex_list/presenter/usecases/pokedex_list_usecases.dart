import 'package:pokedex/app/pokedex_list/domain/entities/result_item.dart';

abstract class FetchALlItemsUsecase {
  Future<List<ResultItem>> call();
}

abstract class FetchCaughtPokemonsUsecase {
  Future<List<int>> call();
}
