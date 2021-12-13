import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokedex/app/pokedex_detail/infra/datasources/pokemon_detail_remote_datasource.dart';
import 'package:pokedex/app/shared/infra/errors.dart';
import 'package:pokedex/services/app_log/app_log.dart';
import 'package:pokedex/services/app_log/log.dart';
import 'package:pokedex/services/network/urls.dart';

class PokemonDetailRemoteDatasourceImpl
    implements PokemonDetailRemoteDatasource {
  final Dio _dio;

  PokemonDetailRemoteDatasourceImpl(this._dio);

  @override
  Future<Map<String, dynamic>> fetchPokemonDetailData(String id) async {
    final endpoint = '${Urls.ACTIVE_SERVER}/${Urls.RESOURCE}/$id';
    try {
      final response = await _dio.get(endpoint);
      if (response.statusCode != HttpStatus.ok) {
        throw NotFound();
      }
      return response.data;
    } on NotFound {
      rethrow;
    } catch (e, stackTrace) {
      final log = Log(exception: e, stackTrace: stackTrace, objectType: this);
      AppLog.logs.add(log);
      throw DatasourceError();
    }
  }
}
