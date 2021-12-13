import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/pokedex_list/domain/entities/result_list.dart';
import 'package:pokedex/app/pokedex_list/infra/repositories/pokedex_list_repository_impl.dart';
import 'package:pokedex/app/shared/infra/errors.dart';

import '../../../../util/pokeapi_list_data.dart';
import '../../pokedex_list.mocks.dart';

void main() {
  group('Test fetchALl from repository with mocked datasource', () {
    final remoteDatasource = MockPokedexListRemoteDatasource();
    final localDatasource = MockPokedexLocalDatasource();
    final repository =
        PokedexListRepositoryImpl(remoteDatasource, localDatasource);

    test('Should complete and return a ResultList', () async {
      final data = POKEAPI_LIST_DATA;
      when(remoteDatasource.fetchAllItemsData())
          .thenAnswer((realInvocation) async => data);
      final future = repository.fetchAllItems();
      expect(future, completes);
      final result = await future;
      expect(result, isNotNull);
      expect(result, isA<ResultList>());
    });

    test(
        'Should return $SERVER_FAILURE message when datasource throws DatasourceError',
        () async {
      when(remoteDatasource.fetchAllItemsData()).thenThrow(DatasourceError());
      final future = repository.fetchAllItems();
      expect(future, throwsA(SERVER_FAILURE));
    });

    test(
        'Should return $NOT_FOUND_FAILURE message when datasource throws DatasourceError',
        () async {
      when(remoteDatasource.fetchAllItemsData()).thenThrow(NotFound());
      final future = repository.fetchAllItems();
      expect(future, throwsA(NOT_FOUND_FAILURE));
    });

    test(
        'Should throw ParserError when an error occurs in ResultListRepositoryModel.fromMap()',
        () async {
      when(remoteDatasource.fetchAllItemsData()).thenThrow(FormatException());
      final future = repository.fetchAllItems();
      expect(future, throwsA(isA<ParserError>()));
    });
  });

  group('Test catchPokemon from repository with mocked datasource', () {
    final remoteDatasource = MockPokedexListRemoteDatasource();
    final localDatasource = MockPokedexLocalDatasource();
    final repository =
        PokedexListRepositoryImpl(remoteDatasource, localDatasource);

    test('Should complete and return a List<int>', () async {
      final data = '1,2,3,4,5';
      when(localDatasource.getCaughtPokemonData())
          .thenAnswer((realInvocation) async => data);
      final future = repository.getCaughtPokemons();
      expect(future, completes);
      final result = await future;
      expect(result, isNotNull);
      expect(result, isA<List>());
    });

    test(
        'Should throw ParserError when an error occurs in ResultListRepositoryModel.fromMap()',
        () async {
      when(localDatasource.getCaughtPokemonData()).thenThrow(FormatException());
      final future = repository.fetchAllItems();
      expect(future, throwsA(isA<ParserError>()));
    });
  });
}
