import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon.dart';
import 'package:pokedex/app/pokedex_detail/presenter/usecases/pokemon_detail_usecases.dart';
import 'package:pokedex/app/pokedex_list/presenter/usecases/pokedex_list_usecases.dart';
import 'package:pokedex/services/app_log/app_log.dart';
import 'package:pokedex/services/app_log/log.dart';

part 'pokemon_detail_store.g.dart';

class PokemonDetailStore = _PokemonDetailStore with _$PokemonDetailStore;

abstract class _PokemonDetailStore with Store {
  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  Pokemon? pokemon;

  ObservableList<int> caughtList = ObservableList<int>();

  @computed
  String get catchButtonLabel =>
      caughtList.contains(pokemon?.id) ? 'Liberar' : 'Capturar';

  @action
  Future<void> initPokemon(int id) async {
    loading = true;
    final fetchPokemonUseCase = GetIt.I<FetchPokemonDetails>();
    final fetchCaughtPokemonsUseCase = GetIt.I<FetchCaughtPokemonsUsecase>();
    try {
      final retrievedPokemon = await fetchPokemonUseCase(id);
      final retrievedCaughtList = await fetchCaughtPokemonsUseCase();
      pokemon = retrievedPokemon;
      caughtList.clear();
      caughtList.addAll(retrievedCaughtList);
      error = null;
    } catch (e) {
      error = e.toString();
    }
    loading = false;
  }

  @observable
  bool catchToggleLoading = false;

  Function()? get toggleCapture => !catchToggleLoading ? _capturePokemon : null;

  @action
  Future<void> _capturePokemon() async {
    catchToggleLoading = true;
    final catchUseCase = GetIt.I<CatchPokemon>();
    try {
      await catchUseCase(pokemon!);
      caughtList.add(pokemon!.id!);
    } catch (e, stackTrace) {
      final log = Log(exception: e, stackTrace: stackTrace, objectType: this);
      AppLog.logs.add(log);
    }
    catchToggleLoading = false;
  }
}
