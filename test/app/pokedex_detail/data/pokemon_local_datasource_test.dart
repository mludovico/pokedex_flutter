import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/pokedex_detail/data/pokemon_local_datasource_impl.dart';
import 'package:pokedex/services/local_storage/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  final datasource = PokemonLocalDatasourceImpl();

  group('Test Pokemon Local Datasource with mocked shared preferences', () {
    test(
        'Should complete and set $CAUGHT_POKEMONS_PREFS_KEY key in preferences',
        () async {
      final content = '[1,2,3,4,5]';
      await datasource.storePokemon(content);
      expect(prefs.containsKey(CAUGHT_POKEMONS_PREFS_KEY), true);
      expect(prefs.getString(CAUGHT_POKEMONS_PREFS_KEY), content);
    });
  });
}
