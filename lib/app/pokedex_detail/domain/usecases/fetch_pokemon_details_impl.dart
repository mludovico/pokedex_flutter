import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon.dart';
import 'package:pokedex/app/pokedex_detail/domain/repositories/pokemon_detail_repository.dart';
import 'package:pokedex/app/pokedex_detail/presenter/usecases/pokemon_detail_usecases.dart';
import 'package:pokedex/services/app_log/app_log.dart';
import 'package:pokedex/services/app_log/log.dart';

const PARSING_ERROR = 'Opa! Não foi possível mostrar as informações';

class FetchPokemonDetailsImpl implements FetchPokemonDetails {
  final PokemonDetailRepository repository;

  FetchPokemonDetailsImpl(this.repository);

  @override
  Future<Pokemon> call(int id) async {
    try {
      final pokemon = await repository.fetchPokemonDetail(id);
      return pokemon;
    } catch (e, stackTrace) {
      final log = Log(exception: e, stackTrace: stackTrace, objectType: this);
      AppLog.logs.add(log);
      return Future.error(PARSING_ERROR);
    }
  }
}
