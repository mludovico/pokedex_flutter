import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/pokedex_detail/infra/models/sprites_repository_model.dart';

import '../../../../util/pokemon_data.dart';

void main() {
  group('Sprites parser tests', () {
    final spritesData = SPRITES_DATA;

    test('Should return a Sprites object with non null properties', () {
      final sprites = SpritesRepositoryModel.fromMap(spritesData);
      expect(sprites, isNotNull);
      expect(sprites.main, isNotNull);
      expect(sprites.main, isA<String>());
      expect(sprites.front, isNotNull);
      expect(sprites.front, isA<String>());
      expect(sprites.back, isNotNull);
      expect(sprites.back, isA<String>());
    });

    final spritesDataWithNulls = SPRITES_DATA_WITH_NULLS;

    test('Should return a Sprites object with null properties', () {
      final sprites = SpritesRepositoryModel.fromMap(spritesDataWithNulls);
      expect(sprites, isNotNull);
      expect(sprites.main, isNull);
      expect(sprites.front, isNull);
      expect(sprites.back, isNull);
    });

    final spritesDataWithInnerNull1 = SPRITES_DATA_WITH_INNER_NULL1;

    test('Should return a Sprites object with null properties', () {
      final sprites = SpritesRepositoryModel.fromMap(spritesDataWithInnerNull1);
      expect(sprites, isNotNull);
      expect(sprites.main, isNull);
    });

    final spritesDataWithInnerNull2 = SPRITES_DATA_WITH_INNER_NULL2;

    test('Should return a Sprites object with null properties', () {
      final sprites = SpritesRepositoryModel.fromMap(spritesDataWithInnerNull2);
      expect(sprites, isNotNull);
      expect(sprites.main, isNull);
    });
  });
}
