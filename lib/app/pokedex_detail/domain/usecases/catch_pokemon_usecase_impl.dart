import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon.dart';
import 'package:pokedex/app/pokedex_detail/domain/repositories/pokemon_detail_repository.dart';
import 'package:pokedex/app/pokedex_detail/presenter/usecases/pokemon_detail_usecases.dart';

class CatchPokemonUsecaseImpl implements CatchPokemon {
  final PokemonDetailRepository _repository;

  CatchPokemonUsecaseImpl(this._repository);

  @override
  Future<void> call(Pokemon pokemon) async {
    await _repository.catchPokemon(pokemon);
  }

}