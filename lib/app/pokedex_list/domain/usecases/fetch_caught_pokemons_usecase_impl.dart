import 'package:pokedex/app/pokedex_list/domain/repositories/pokedex_list_repository.dart';
import 'package:pokedex/app/pokedex_list/presenter/usecases/pokedex_list_usecases.dart';

class FetchCaughtPokemonsUsecaseImpl implements FetchCaughtPokemonsUsecase {
  final PokedexListRepository _repository;

  FetchCaughtPokemonsUsecaseImpl(this._repository);

  @override
  Future<List<int>> call() async {
    final list = await _repository.getCaughtPokemons();
    return list;
  }
}
