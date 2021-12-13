import 'package:pokedex/app/pokedex_list/infra/datasources/pokedex_local_datasource.dart';
import 'package:pokedex/app/shared/infra/errors.dart';
import 'package:pokedex/services/app_log/app_log.dart';
import 'package:pokedex/services/app_log/log.dart';
import 'package:pokedex/services/local_storage/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokedexLocalDatasourceImpl implements PokedexLocalDatasource {
  @override
  Future<String?> getCaughtPokemonData() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final content = prefs.getString(CAUGHT_POKEMONS_PREFS_KEY);
      return content;
    } catch (e, stackTrace) {
      final log = Log(exception: e, stackTrace: stackTrace, objectType: this);
      AppLog.logs.add(log);
      throw DatasourceError();
    }
  }
}
