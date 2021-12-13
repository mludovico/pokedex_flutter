import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokedex/app/pokedex_list/infra/datasources/pokedex_list_remote_datasource.dart';
import 'package:pokedex/app/shared/infra/errors.dart';
import 'package:pokedex/services/app_log/app_log.dart';
import 'package:pokedex/services/app_log/log.dart';
import 'package:pokedex/services/network/urls.dart';

class PokedexListRemoteDatasourceImpl implements PokedexListRemoteDatasource {
  final Dio _dio;

  PokedexListRemoteDatasourceImpl(this._dio);

  @override
  Future<Map<String, dynamic>> fetchAllItemsData() async {
    final endpoint = '${Urls.ACTIVE_SERVER}/${Urls.RESOURCE}?limit=1500';
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
