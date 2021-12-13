import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/pokedex_detail/data/pokemon_detail_remote_datasource_impl.dart';
import 'package:pokedex/app/shared/infra/errors.dart';

import '../../../util/pokemon_data.dart';
import '../../dio.mocks.dart';

void main() {
  final dio = MockDio();
  final datasource = PokemonDetailRemoteDatasourceImpl(dio);

  group('Test Pokemon Detail Remote Datasource Impl with mocked dio', () {
    test('Should complete and return a Map<String, dynamic>', () async {
      final data = POKEMON_DATA;
      final options = RequestOptions(path: '');
      final response = Response(
        requestOptions: options,
        data: data,
        statusCode: HttpStatus.ok,
      );
      when(dio.get(any)).thenAnswer((realInvocation) async => response);
      final future = datasource.fetchPokemonDetailData('id');
      expect(future, completes);
      final result = await future;
      expect(result, isNotNull);
      expect(result, isA<Map<String, dynamic>>());
    });

    test('Should throw Datasource when dio crashes', () async {
      when(dio.get(any)).thenThrow(Exception());
      final future = datasource.fetchPokemonDetailData('id');
      expect(future, throwsA(isA<DatasourceError>()));
    });

    test('Should throw NotFound when response is other than 200', () async {
      final options = RequestOptions(path: '');
      final response = Response(
        requestOptions: options,
        statusCode: HttpStatus.notFound,
      );
      when(dio.get(any)).thenAnswer((_) async => response);
      final future = datasource.fetchPokemonDetailData('id');
      expect(future, throwsA(isA<NotFound>()));
    });
  });
}
