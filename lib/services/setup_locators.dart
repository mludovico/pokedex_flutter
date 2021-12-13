import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/app/pokedex_detail/data/pokemon_detail_remote_datasource_impl.dart';
import 'package:pokedex/app/pokedex_detail/data/pokemon_local_datasource_impl.dart';
import 'package:pokedex/app/pokedex_detail/domain/repositories/pokemon_detail_repository.dart';
import 'package:pokedex/app/pokedex_detail/domain/usecases/catch_pokemon_usecase_impl.dart';
import 'package:pokedex/app/pokedex_detail/domain/usecases/fetch_pokemon_details_impl.dart';
import 'package:pokedex/app/pokedex_detail/infra/datasources/pokemon_detail_remote_datasource.dart';
import 'package:pokedex/app/pokedex_detail/infra/datasources/pokemon_local_datasource.dart';
import 'package:pokedex/app/pokedex_detail/infra/repositories/pokemon_detail_repository_impl.dart';
import 'package:pokedex/app/pokedex_detail/presenter/usecases/pokemon_detail_usecases.dart';
import 'package:pokedex/app/pokedex_list/data/pokedex_list_datasource_impl.dart';
import 'package:pokedex/app/pokedex_list/data/pokedex_local_datasource_impl.dart';
import 'package:pokedex/app/pokedex_list/domain/repositories/pokedex_list_repository.dart';
import 'package:pokedex/app/pokedex_list/domain/usecases/fetch_all_items_usecase_impl.dart';
import 'package:pokedex/app/pokedex_list/domain/usecases/fetch_caught_pokemons_usecase_impl.dart';
import 'package:pokedex/app/pokedex_list/infra/datasources/pokedex_list_remote_datasource.dart';
import 'package:pokedex/app/pokedex_list/infra/datasources/pokedex_local_datasource.dart';
import 'package:pokedex/app/pokedex_list/infra/repositories/pokedex_list_repository_impl.dart';
import 'package:pokedex/app/pokedex_list/presenter/usecases/pokedex_list_usecases.dart';
import 'package:pokedex/services/network/custom_dio.dart';

Future<void> setupLocators() async {
  final _dio = CustomDio.buildClient();
  GetIt.I.registerSingleton<Dio>(_dio);

  /// Datasources
  GetIt.I.registerSingleton<PokedexListRemoteDatasource>(
    PokedexListRemoteDatasourceImpl(_dio),
  );
  GetIt.I.registerSingleton<PokedexLocalDatasource>(
    PokedexLocalDatasourceImpl(),
  );
  GetIt.I.registerSingleton<PokemonDetailRemoteDatasource>(
    PokemonDetailRemoteDatasourceImpl(_dio),
  );
  GetIt.I.registerSingleton<PokemonLocalDatasource>(
    PokemonLocalDatasourceImpl(),
  );

  /// Repositories
  GetIt.I.registerSingleton<PokedexListRepository>(
    PokedexListRepositoryImpl(
      GetIt.I<PokedexListRemoteDatasource>(),
      GetIt.I<PokedexLocalDatasource>(),
    ),
  );
  GetIt.I.registerSingleton<PokemonDetailRepository>(
    PokemonDetailRepositoryImpl(
      GetIt.I<PokemonDetailRemoteDatasource>(),
      GetIt.I<PokemonLocalDatasource>(),
    ),
  );

  /// Usecases
  GetIt.I.registerSingleton<FetchALlItemsUsecase>(
    FetchAllItemsUsecaseImpl(
      GetIt.I<PokedexListRepository>(),
    ),
  );
  GetIt.I.registerSingleton<FetchPokemonDetails>(
    FetchPokemonDetailsImpl(
      GetIt.I<PokemonDetailRepository>(),
    ),
  );
  GetIt.I.registerSingleton<FetchCaughtPokemonsUsecase>(
    FetchCaughtPokemonsUsecaseImpl(
      GetIt.I<PokedexListRepository>(),
    ),
  );
  GetIt.I.registerSingleton<CatchPokemon>(
    CatchPokemonUsecaseImpl(
      GetIt.I<PokemonDetailRepository>(),
    ),
  );
}
