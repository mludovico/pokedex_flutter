import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon.dart';

abstract class PokemonDetailRepository {
  Future<Pokemon> fetchPokemonDetail(int id);
  Future<void> catchPokemon(Pokemon pokemon);
}
