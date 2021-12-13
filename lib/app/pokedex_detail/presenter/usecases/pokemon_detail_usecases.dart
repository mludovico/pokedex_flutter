import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon.dart';

abstract class FetchPokemonDetails {
  Future<Pokemon> call(int id);
}

abstract class CatchPokemon {
  Future<void> call(Pokemon pokemon);
}
