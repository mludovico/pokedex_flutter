import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/pokedex_list/domain/entities/result_list.dart';
import 'package:pokedex/app/pokedex_list/infra/models/result_list_repository_model.dart';

import '../../../../util/pokeapi_list_data.dart';

void main() {
  group('Mocked data list parsers tests', () {
    final listData = POKEAPI_LIST_DATA;
    final listDataWithNulls = POKEAPI_LIST_DATA_WITH_NULLS;

    test('Should return a ResultList with non null properties', () {
      final result = ResultListRepositoryModel.fromMap(listData);
      expect(result, isA<ResultList>());
      expect(result.count, isNotNull);
      expect(result.count, isA<int>());
      expect(result.results, isNotNull);
      expect(result.results, isA<List>());
      expect(result.results, isNotEmpty);
    });

    test('Should return a ResultList with null properties', () {
      final result = ResultListRepositoryModel.fromMap(listDataWithNulls);
      expect(result, isA<ResultList>());
      expect(result.count, isNull);
      expect(result.results, isNull);
    });
  });
}
