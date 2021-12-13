import 'package:pokedex/app/pokedex_detail/infra/datasources/pokemon_local_datasource.dart';
import 'package:pokedex/app/shared/infra/errors.dart';
import 'package:pokedex/services/app_log/app_log.dart';
import 'package:pokedex/services/app_log/log.dart';
import 'package:pokedex/services/local_storage/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonLocalDatasourceImpl implements PokemonLocalDatasource {
  @override
  Future<void> storePokemon(String content) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      prefs.setString(CAUGHT_POKEMONS_PREFS_KEY, content);
    } catch (e, stackTrace) {
      final log = Log(exception: e, stackTrace: stackTrace, objectType: this);
      AppLog.logs.add(log);
      throw DatasourceError();
    }
  }
}
