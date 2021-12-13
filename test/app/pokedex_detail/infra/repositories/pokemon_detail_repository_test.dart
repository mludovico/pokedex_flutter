import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon.dart';
import 'package:pokedex/app/pokedex_detail/infra/repositories/pokemon_detail_repository_impl.dart';
import 'package:pokedex/app/shared/infra/errors.dart';

import '../../../../util/pokemon_data.dart';
import '../../pokedex_detail.mocks.dart';

void main() {
  final remoteDatasource = MockPokemonDetailRemoteDatasource();
  final localDatasource = MockPokemonLocalDatasource();
  final repository =
      PokemonDetailRepositoryImpl(remoteDatasource, localDatasource);

  group('Test Pokemon Detail Repository with mocked remote datasource', () {
    test('Should return a Pokemon object', () async {
      final data = POKEMON_DATA;
      when(remoteDatasource.fetchPokemonDetailData(any))
          .thenAnswer((_) async => data);
      final future = repository.fetchPokemonDetail(1);
      expect(future, completes);
      final result = await future;
      expect(result, isNotNull);
      expect(result, isA<Pokemon>());
    });

    test('Should return $SERVER_FAILURE when datasource throws DatasourceError',
        () async {
      when(remoteDatasource.fetchPokemonDetailData(any))
          .thenThrow(DatasourceError());
      final future = repository.fetchPokemonDetail(0);
      expect(future, throwsA(SERVER_FAILURE));
    });

    test(
        'Should return $NOT_FOUND_FAILURE when datasource throws DatasourceError',
        () async {
      when(remoteDatasource.fetchPokemonDetailData(any)).thenThrow(NotFound());
      final future = repository.fetchPokemonDetail(0);
      expect(future, throwsA(NOT_FOUND_FAILURE));
    });

    test(
        'Should throw ParseError when error occur in PokemonRepositoryModel.fromMap()',
        () async {
      when(remoteDatasource.fetchPokemonDetailData(any))
          .thenThrow(FormatException());
      final future = repository.fetchPokemonDetail(0);
      expect(future, throwsA(isA<ParserError>()));
    });
  });
}
