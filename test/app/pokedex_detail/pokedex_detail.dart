import 'package:mockito/annotations.dart';
import 'package:pokedex/app/pokedex_detail/domain/repositories/pokemon_detail_repository.dart';
import 'package:pokedex/app/pokedex_detail/infra/datasources/pokemon_detail_remote_datasource.dart';
import 'package:pokedex/app/pokedex_detail/infra/datasources/pokemon_local_datasource.dart';
import 'package:pokedex/app/pokedex_detail/presenter/usecases/pokemon_detail_usecases.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  SharedPreferences,
  PokemonDetailRemoteDatasource,
  PokemonLocalDatasource,
  PokemonDetailRepository,
  FetchPokemonDetails,
])
void main() {}
