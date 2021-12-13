// Mocks generated by Mockito 5.0.6 from annotations
// in pokedex/test/app/pokedex_list/pokedex_list.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex/app/pokedex_list/domain/entities/result_item.dart'
    as _i8;
import 'package:pokedex/app/pokedex_list/domain/entities/result_list.dart'
    as _i2;
import 'package:pokedex/app/pokedex_list/domain/repositories/pokedex_list_repository.dart'
    as _i6;
import 'package:pokedex/app/pokedex_list/infra/datasources/pokedex_list_remote_datasource.dart'
    as _i3;
import 'package:pokedex/app/pokedex_list/infra/datasources/pokedex_local_datasource.dart'
    as _i5;
import 'package:pokedex/app/pokedex_list/infra/models/result_list_repository_model.dart'
    as _i9;
import 'package:pokedex/app/pokedex_list/presenter/usecases/pokedex_list_usecases.dart'
    as _i7;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeResultList extends _i1.Fake implements _i2.ResultList {}

/// A class which mocks [PokedexListRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokedexListRemoteDatasource extends _i1.Mock
    implements _i3.PokedexListRemoteDatasource {
  MockPokedexListRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<Map<String, dynamic>> fetchAllItemsData() => (super.noSuchMethod(
          Invocation.method(#fetchAllItemsData, []),
          returnValue: Future<Map<String, dynamic>>.value(<String, dynamic>{}))
      as _i4.Future<Map<String, dynamic>>);
}

/// A class which mocks [PokedexLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokedexLocalDatasource extends _i1.Mock
    implements _i5.PokedexLocalDatasource {
  MockPokedexLocalDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<String?> getCaughtPokemonData() =>
      (super.noSuchMethod(Invocation.method(#getCaughtPokemonData, []),
          returnValue: Future<String?>.value('')) as _i4.Future<String?>);
}

/// A class which mocks [PokedexListRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokedexListRepository extends _i1.Mock
    implements _i6.PokedexListRepository {
  MockPokedexListRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ResultList> fetchAllItems() =>
      (super.noSuchMethod(Invocation.method(#fetchAllItems, []),
              returnValue: Future<_i2.ResultList>.value(_FakeResultList()))
          as _i4.Future<_i2.ResultList>);
  @override
  _i4.Future<List<int>> getCaughtPokemons() => (super.noSuchMethod(
      Invocation.method(#getCaughtPokemons, []),
      returnValue: Future<List<int>>.value(<int>[])) as _i4.Future<List<int>>);
}

/// A class which mocks [FetchALlItemsUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchALlItemsUsecase extends _i1.Mock
    implements _i7.FetchALlItemsUsecase {
  MockFetchALlItemsUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i8.ResultItem>> call() => (super.noSuchMethod(
          Invocation.method(#call, []),
          returnValue: Future<List<_i8.ResultItem>>.value(<_i8.ResultItem>[]))
      as _i4.Future<List<_i8.ResultItem>>);
}

/// A class which mocks [ResultListRepositoryModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockResultListRepositoryModel extends _i1.Mock
    implements _i9.ResultListRepositoryModel {
  MockResultListRepositoryModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set count(int? _count) =>
      super.noSuchMethod(Invocation.setter(#count, _count),
          returnValueForMissingStub: null);
  @override
  set results(List<_i8.ResultItem>? _results) =>
      super.noSuchMethod(Invocation.setter(#results, _results),
          returnValueForMissingStub: null);
  @override
  Map<String, dynamic> toMap() =>
      (super.noSuchMethod(Invocation.method(#toMap, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  String toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []), returnValue: '')
          as String);
  @override
  String toString() =>
      (super.noSuchMethod(Invocation.method(#toString, []), returnValue: '')
          as String);
  @override
  _i2.ResultList copyWith({int? count, List<_i8.ResultItem>? results}) =>
      (super.noSuchMethod(
          Invocation.method(#copyWith, [], {#count: count, #results: results}),
          returnValue: _FakeResultList()) as _i2.ResultList);
}