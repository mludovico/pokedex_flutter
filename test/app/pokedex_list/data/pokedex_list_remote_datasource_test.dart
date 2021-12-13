import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/pokedex_list/data/pokedex_list_datasource_impl.dart';
import 'package:pokedex/app/shared/infra/errors.dart';

import '../../../util/pokeapi_list_data.dart';
import '../../dio.mocks.dart';

void main() {
  group('Mocked dio datasouce testes', () {
    final dio = MockDio();
    final datasource = PokedexListRemoteDatasourceImpl(dio);
    final RequestOptions options = RequestOptions(path: '');
    final data = POKEAPI_RESULT_DATA;

    test('Should complete return Map<String, dynamic>', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(
          requestOptions: options, statusCode: HttpStatus.ok, data: data));
      final future = datasource.fetchAllItemsData();
      expect(future, completes);
      final result = await future;
      expect(result, isNotNull);
      expect(result, isA<Map<String, dynamic>>());
    });

    test('Should throw DatasourceError when dio crashes', () async {
      when(dio.get(any)).thenThrow(Exception());
      final future = datasource.fetchAllItemsData();
      expect(future, throwsA(isA<DatasourceError>()));
    });

    test('Should throw NotFound when dio returns 404', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(
          requestOptions: options,
          statusCode: HttpStatus.notFound,
          data: data));
      final future = datasource.fetchAllItemsData();
      expect(future, throwsA(isA<NotFound>()));
    });
  });
}
