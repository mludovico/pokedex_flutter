import 'package:mockito/annotations.dart';
import 'package:pokedex/app/pokedex_list/domain/repositories/pokedex_list_repository.dart';
import 'package:pokedex/app/pokedex_list/infra/datasources/pokedex_list_remote_datasource.dart';
import 'package:pokedex/app/pokedex_list/infra/datasources/pokedex_local_datasource.dart';
import 'package:pokedex/app/pokedex_list/infra/models/result_list_repository_model.dart';
import 'package:pokedex/app/pokedex_list/presenter/usecases/pokedex_list_usecases.dart';

@GenerateMocks([
  PokedexListRemoteDatasource,
  PokedexLocalDatasource,
  PokedexListRepository,
  FetchALlItemsUsecase,
  ResultListRepositoryModel,
])
void main() {}
