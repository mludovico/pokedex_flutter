import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon.dart';
import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon_type.dart';
import 'package:pokedex/app/pokedex_detail/domain/entities/sprites.dart';
import 'package:pokedex/app/pokedex_detail/infra/models/pokemon_repository_model.dart';

import '../../../../util/pokemon_data.dart';

void main() {
  group('Pokemon parsers tests', () {
    final pokemonData = POKEMON_DATA;

    test('Should return a Pokemon object with non null properties', () {
      final result = PokemonRepositoryModel.fromMap(pokemonData);
      expect(result, isA<Pokemon>());
      expect(result.id, isNotNull);
      expect(result.id, isA<int>());
      expect(result.name, isNotNull);
      expect(result.name, isA<String>());
      expect(result.height, isNotNull);
      expect(result.height, isA<int>());
      expect(result.weight, isNotNull);
      expect(result.weight, isA<int>());
      expect(result.sprites, isNotNull);
      expect(result.sprites, isA<Sprites>());
      expect(result.types, isNotNull);
      expect(result.types, isNotEmpty);
      expect(result.types?.first, isA<PokemonType>());
    });

    final pokemonDataWithNulls = POKEMON_DATA_WITH_NULLS;

    test('Should return a Pokenon object with null properties', () {
      final pokemon = PokemonRepositoryModel.fromMap(pokemonDataWithNulls);
      expect(pokemon, isNotNull);
      expect(pokemon, isA<Pokemon>());
      expect(pokemon.id, isNull);
      expect(pokemon.name, isNull);
      expect(pokemon.height, isNull);
      expect(pokemon.weight, isNull);
      expect(pokemon.sprites, isNull);
      expect(pokemon.types, isNull);
    });
  });
}
