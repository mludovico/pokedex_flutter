import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/pokedex_list/domain/entities/result_item.dart';
import 'package:pokedex/app/pokedex_list/infra/models/result_item_repository_model.dart';

import '../../../../util/pokeapi_list_data.dart';

void main() {
  group('Mocked data item parsers tests', () {
    final itemData = POKEAPI_RESULT_DATA;
    final itemDataWithNulls = POKEAPI_RESULT_DATA_WITH_NULLS;

    test('Should return a ResultItem with non null properties', () {
      final result = ResultItemRepositoryModel.fromMap(itemData);
      expect(result, isA<ResultItem>());
      expect(result.name, isNotNull);
      expect(result.name, isA<String>());
      expect(result.url, isNotNull);
      expect(result.url, isA<String>());
    });

    test('Should return a ResultList with null properties', () {
      final result = ResultItemRepositoryModel.fromMap(itemDataWithNulls);
      expect(result, isA<ResultItem>());
      expect(result.name, isNull);
      expect(result.url, isNull);
    });
  });
}
