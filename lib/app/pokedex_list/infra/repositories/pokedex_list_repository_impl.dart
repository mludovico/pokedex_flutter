import 'package:pokedex/app/pokedex_list/domain/entities/result_list.dart';
import 'package:pokedex/app/pokedex_list/domain/repositories/pokedex_list_repository.dart';
import 'package:pokedex/app/pokedex_list/infra/datasources/pokedex_list_remote_datasource.dart';
import 'package:pokedex/app/pokedex_list/infra/datasources/pokedex_local_datasource.dart';
import 'package:pokedex/app/pokedex_list/infra/models/result_list_repository_model.dart';
import 'package:pokedex/app/shared/infra/errors.dart';
import 'package:pokedex/services/app_log/app_log.dart';
import 'package:pokedex/services/app_log/log.dart';

const SERVER_FAILURE = 'Houve um erro na comunicação com o servidor.';
const NOT_FOUND_FAILURE = 'Pokemon não encontrado.';

class PokedexListRepositoryImpl implements PokedexListRepository {
  final PokedexListRemoteDatasource _remoteDatasource;
  final PokedexLocalDatasource _localDatasource;

  PokedexListRepositoryImpl(this._remoteDatasource, this._localDatasource);

  @override
  Future<ResultList> fetchAllItems() async {
    try {
      final resultListData = await _remoteDatasource.fetchAllItemsData();
      final resultList = ResultListRepositoryModel.fromMap(resultListData);
      return resultList;
    } on DatasourceError {
      return Future.error(SERVER_FAILURE);
    } on NotFound {
      return Future.error(NOT_FOUND_FAILURE);
    } catch (e, stackTrace) {
      final log = Log(exception: e, stackTrace: stackTrace, objectType: this);
      AppLog.logs.add(log);
      throw ParserError();
    }
  }

  @override
  Future<List<int>> getCaughtPokemons() async {
    try {
      final caughtPokemonsData = await _localDatasource.getCaughtPokemonData();
      final list = caughtPokemonsData
              ?.split(',')
              .map((id) => int.tryParse(id) ?? -1)
              .where((id) => id > 0)
              .toList() ??
          [];
      return list;
    } catch (e, stackTrace) {
      final log = Log(exception: e, stackTrace: stackTrace, objectType: this);
      AppLog.logs.add(log);
      throw ParserError();
    }
  }
}
