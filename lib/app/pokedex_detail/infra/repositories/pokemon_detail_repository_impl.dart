import 'package:get_it/get_it.dart';
import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon.dart';
import 'package:pokedex/app/pokedex_detail/domain/repositories/pokemon_detail_repository.dart';
import 'package:pokedex/app/pokedex_detail/infra/datasources/pokemon_detail_remote_datasource.dart';
import 'package:pokedex/app/pokedex_detail/infra/datasources/pokemon_local_datasource.dart';
import 'package:pokedex/app/pokedex_detail/infra/models/pokemon_repository_model.dart';
import 'package:pokedex/app/pokedex_list/domain/repositories/pokedex_list_repository.dart';
import 'package:pokedex/app/shared/infra/errors.dart';
import 'package:pokedex/services/app_log/app_log.dart';
import 'package:pokedex/services/app_log/log.dart';

const SERVER_FAILURE = 'Houve um erro na comunicação com o servidor.';
const NOT_FOUND_FAILURE = 'Pokemon não encontrado.';

class PokemonDetailRepositoryImpl implements PokemonDetailRepository {
  final PokemonDetailRemoteDatasource _remoteDatasource;
  final PokemonLocalDatasource _localDatasource;

  PokemonDetailRepositoryImpl(this._remoteDatasource, this._localDatasource);

  @override
  Future<void> catchPokemon(Pokemon pokemon) async {
    final pokedexListRepository = GetIt.I<PokedexListRepository>();
    final caughtPokemons = await pokedexListRepository.getCaughtPokemons();
    if (caughtPokemons.contains(pokemon.id)) {
      caughtPokemons.removeWhere((element) => element == pokemon.id);
    } else {
      caughtPokemons.add(pokemon.id!);
    }
    final content = caughtPokemons.join(',');
    _localDatasource.storePokemon(content);
  }

  @override
  Future<Pokemon> fetchPokemonDetail(int id) async {
    try {
      final pokemonData =
          await _remoteDatasource.fetchPokemonDetailData(id.toString());
      final pokemon = PokemonRepositoryModel.fromMap(pokemonData);
      return pokemon;
    } on DatasourceError {
      return Future.error(SERVER_FAILURE);
    } on NotFound {
      return Future.error(NOT_FOUND_FAILURE);
    } catch (e, stackTrace) {
      final log = Log(exception: e, stackTrace: stackTrace, objectType: this);
      AppLog.logs.add(log);
      throw ParserError();
    }
  }
}
