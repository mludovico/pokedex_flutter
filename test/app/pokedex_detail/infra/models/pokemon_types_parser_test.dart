import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/pokedex_detail/infra/models/pokemon_type_repository_model.dart';

import '../../../../util/pokemon_data.dart';

void main() {
  group('Pokemon type parser testes', () {
    final typesData = TYPES_DATA;

    test('Should return a list of PokemonType', () {
      final types = typesData
          .map((type) => PokemonTypeRepositoryModel.fromMap(type))
          .toList();
      expect(types, isNotNull);
      expect(types, isA<List>());
      expect(types, isNotEmpty);
    });

    final typesDataWithNulls = TYPES_DATA_WITH_NULLS;

    test('Should return a list of PokemonType with null properties', () {
      final types = typesDataWithNulls
          .map((type) => PokemonTypeRepositoryModel.fromMap(type))
          .toList();
      expect(types, isNotNull);
      expect(types, isA<List>());
      expect(types, isNotEmpty);
      expect(types.first, isNotNull);
      expect(types.first.slot, isNull);
      expect(types.first.type, isNull);
      expect(types.last.type, isNull);
    });
  });
}
