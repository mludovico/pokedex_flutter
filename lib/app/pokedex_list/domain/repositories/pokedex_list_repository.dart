import 'package:pokedex/app/pokedex_list/domain/entities/result_list.dart';

abstract class PokedexListRepository {
  Future<ResultList> fetchAllItems();
  Future<List<int>> getCaughtPokemons();
}
